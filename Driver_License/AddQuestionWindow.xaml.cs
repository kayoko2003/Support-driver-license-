using Driver_License.Models;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Windows;
using System.Windows.Controls;
using System.Windows.Data;
using System.Windows.Documents;
using System.Windows.Input;
using System.Windows.Media;
using System.Windows.Media.Imaging;
using System.Windows.Shapes;

namespace Driver_License
{
    /// <summary>
    /// Interaction logic for AddQuestionWindow.xaml
    /// </summary>
    public partial class AddQuestionWindow : Window
    {
        private Account account;
        private readonly SupportLicenseContext context = new SupportLicenseContext();
        private int answerCount = 2;
        public AddQuestionWindow(Account account)
        {
            this.account = account;
            InitializeComponent();
            LoadQuestionType();
            LoadLicenseTypes();
        }

        private void LoadQuestionType()
        {
            var questionTypes = context.QuestionTypes.ToList();
            cbQuestionType.ItemsSource = questionTypes;
            cbQuestionType.DisplayMemberPath = "Content";
            cbQuestionType.SelectedIndex = 0;
        }

        private void LoadLicenseTypes()
        {
            var licenseTypes = context.LicenseTypes.ToList();
            lbLicenseTypes.ItemsSource = licenseTypes;
            lbLicenseTypes.DisplayMemberPath = "Name";
        }

        private void SaveButton_Click(object sender, RoutedEventArgs e)
        {
            if (string.IsNullOrWhiteSpace(tbQuestionContent.Text))
            {
                MessageBox.Show("Vui lòng nhập nội dung câu hỏi.", "Thông báo", MessageBoxButton.OK, MessageBoxImage.Warning);
                return;
            }

            if (cbQuestionType.SelectedItem == null)
            {
                MessageBox.Show("Vui lòng chọn loại câu hỏi.", "Thông báo", MessageBoxButton.OK, MessageBoxImage.Warning);
                return;
            }

            if (lbLicenseTypes.SelectedItems.Count == 0)
            {
                MessageBox.Show("Vui lòng chọn ít nhất một loại giấy phép.", "Thông báo", MessageBoxButton.OK, MessageBoxImage.Warning);
                return;
            }


            bool hasValidAnswer = false;
            for (int i = 1; i <= answerCount; i++)
            {
                var tbAnswer = spAnswers.FindName($"tbAnswer{i}") as TextBox;
                var cbCorrect = spAnswers.FindName($"cbCorrect{i}") as CheckBox;

                if (tbAnswer != null && !string.IsNullOrWhiteSpace(tbAnswer.Text))
                {
                    if (cbCorrect.IsChecked == true)
                    {
                        hasValidAnswer = true;
                    }
                }
                else
                {
                    hasValidAnswer = false;
                    break;
                }
            }

            if (!hasValidAnswer)
            {
                MessageBox.Show("Vui lòng nhập ít nhất một đáp án và chọn đáp án đúng.");
                return;
            }

            var newQuestion = new Question
            {
                Content = tbQuestionContent.Text,
                QuestionTypeId = (cbQuestionType.SelectedItem as QuestionType)?.QuestionTypeId,
                Image = tbImage.Text,
                Explain = tbExplain.Text,
                CreateBy = account.AccountId,
                IsDelete = false
            };

            foreach (var selectedLicenseType in lbLicenseTypes.SelectedItems)
            {
                newQuestion.LicenseTypes.Add(selectedLicenseType as LicenseType);
            }

            for (int i = 1; i <= answerCount; i++)
            {
                var tbAnswer = spAnswers.FindName($"tbAnswer{i}") as TextBox;
                var cbCorrect = spAnswers.FindName($"cbCorrect{i}") as CheckBox;

                if (tbAnswer != null && !string.IsNullOrWhiteSpace(tbAnswer.Text))
                {
                    AddAnswer(newQuestion, tbAnswer.Text, cbCorrect.IsChecked == true);
                }
            }

            context.Questions.Add(newQuestion);
            context.SaveChanges();

            MessageBox.Show("Câu hỏi mới đã được lưu thành công!");
            this.Close();
        }

        private void AddAnswer(Question question, string content, bool isCorrect)
        {
            if (!string.IsNullOrWhiteSpace(content))
            {
                var answer = new Answer
                {
                    Content = content,
                    CorrectAnswer = isCorrect
                };
                question.Answers.Add(answer);
            }
        }

        private void AddAnswerButton_Click(object sender, RoutedEventArgs e)
        {
            answerCount++;
            var stackPanel = new StackPanel { Orientation = Orientation.Horizontal, Margin = new Thickness(0, 0, 0, 10) };

            var tbAnswer = new TextBox { Name = $"tbAnswer{answerCount}", Width = 300, Margin = new Thickness(0, 0, 10, 0) };
            var cbCorrect = new CheckBox { Name = $"cbCorrect{answerCount}", Content = "Đáp án đúng" };
            cbCorrect.Checked += CheckBox_Checked;

            stackPanel.Children.Add(tbAnswer);
            stackPanel.Children.Add(cbCorrect);

            spAnswers.Children.Add(stackPanel);

            RegisterName(tbAnswer.Name, tbAnswer);
            RegisterName(cbCorrect.Name, cbCorrect);
        }

        private void CheckBox_Checked(object sender, RoutedEventArgs e)
        {
            // Bỏ chọn tất cả các checkbox khác
            foreach (var child in spAnswers.Children)
            {
                if (child is StackPanel stackPanel)
                {
                    foreach (var control in stackPanel.Children)
                    {
                        if (control is CheckBox checkBox && checkBox != sender)
                        {
                            checkBox.IsChecked = false;
                        }
                    }
                }
            }
        }
    }
}
