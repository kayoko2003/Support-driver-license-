using Driver_License.Models;
using Microsoft.EntityFrameworkCore;
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
    /// Interaction logic for QuestionDetailsWindow.xaml
    /// </summary>
    public partial class QuestionDetailsWindow : Window
    {
        private readonly SupportLicenseContext context = new SupportLicenseContext();
        private Question question;
        private int answerCount = 0;
        private Account account;
        public QuestionDetailsWindow(Question question, Account account)
        {
            InitializeComponent();
            this.question = question;
            this.account = account;
            LoadQuestionTypes();
            LoadLicenseTypes();
            LoadQuestionDetails(question);
        }
        private void LoadQuestionTypes()
        {
            var questionTypes = context.QuestionTypes.ToList();
            cbQuestionType.ItemsSource = questionTypes;
            cbQuestionType.DisplayMemberPath = "Content";
        }

        private void LoadLicenseTypes()
        {
            var licenseTypes = context.LicenseTypes.ToList();
            lbLicenseTypes.ItemsSource = licenseTypes;
            lbLicenseTypes.DisplayMemberPath = "Name";
        }

        private void LoadQuestionDetails(Question question)
        {
            var questionType = context.QuestionTypes.FirstOrDefault(x => x.QuestionTypeId == question.QuestionTypeId);
            List<LicenseType> licenseTypes = context.LicenseTypes
                .Where(l => l.Questions.Any(q => q.QuestionId == question.QuestionId))
                .ToList();
            tbQuestionContent.Text = question.Content;
            tbImage.Text = question.Image;
            tbExplain.Text = question.Explain;
            cbQuestionType.SelectedItem = questionType;

            foreach (var licenseType in licenseTypes)
            {
                lbLicenseTypes.SelectedItems.Add(licenseType);
            }

            List<Answer> answers = context.Answers.Where(l => l.Question.QuestionId == question.QuestionId).ToList();

            foreach (var answer in answers)
            {
                AddAnswer(answer.Content, answer.CorrectAnswer);
            }
        }
        private void AddAnswerButton_Click(object sender, RoutedEventArgs e)
        {
            AddAnswer(string.Empty, false);
        }

        private void AddAnswer(string content, bool isCorrect)
        {
            answerCount++;

            var tbAnswer = new TextBox
            {
                Name = $"tbAnswer{answerCount}",
                Text = content,
                Width = 300,
                Margin = new Thickness(0, 0, 10, 0)
            };

            var cbCorrect = new CheckBox
            {
                Name = $"cbCorrect{answerCount}",
                Content = "Đáp án đúng",
                IsChecked = isCorrect,
                Margin = new Thickness(0, 0, 0, 10)
            };
            cbCorrect.Checked += CheckBox_Checked;

            var spAnswer = new StackPanel
            {
                Orientation = Orientation.Horizontal,
                Margin = new Thickness(0, 0, 0, 10)
            };

            var btnDelete = new Button
            {
                Name = $"btnDelete{answerCount}",
                Content = "Xóa",
                Width = 50,
                Margin = new Thickness(0, 0, 0, 10)
            };
            btnDelete.Click += DeleteAnswerButton_Click;

            spAnswer.Children.Add(tbAnswer);
            spAnswer.Children.Add(cbCorrect);
            spAnswer.Children.Add(btnDelete);

            spAnswers.Children.Add(spAnswer);

            RegisterName(tbAnswer.Name, tbAnswer);
            RegisterName(cbCorrect.Name, cbCorrect);
            RegisterName(btnDelete.Name, btnDelete);
        }

        private void DeleteAnswerButton_Click(object sender, RoutedEventArgs e)
        {
            var button = sender as Button;
            if (button != null)
            {
                var spAnswer = button.Parent as StackPanel;
                if (spAnswer != null)
                {
                    foreach (var child in spAnswer.Children.OfType<UIElement>())
                    {
                        if (child is TextBox tbAnswer)
                        {
                            UnregisterName(tbAnswer.Name);
                        }
                        if (child is CheckBox cbCorrect)
                        {
                            UnregisterName(cbCorrect.Name);
                        }
                        if (child is Button btnDelete)
                        {
                            UnregisterName(btnDelete.Name);
                        }
                    }

                    spAnswers.Children.Remove(spAnswer);
                    answerCount--;
                }
            }
        }

        private void CheckBox_Checked(object sender, RoutedEventArgs e)
        {
            var currentCheckBox = sender as CheckBox;

            foreach (var stackPanel in spAnswers.Children.OfType<StackPanel>())
            {
                foreach (var checkBox in stackPanel.Children.OfType<CheckBox>())
                {
                    if (checkBox != currentCheckBox)
                    {
                        checkBox.IsChecked = false;
                    }
                }
            }
        }

        private bool isEnable = true;
        private void EnableEditing_Click(object sender, RoutedEventArgs e)
        {
            // Enable all controls for editing
            tbQuestionContent.IsEnabled = isEnable;
            cbQuestionType.IsEnabled = isEnable;
            lbLicenseTypes.IsEnabled = isEnable;
            tbImage.IsEnabled = isEnable;
            tbExplain.IsEnabled = isEnable;
            spAnswers.IsEnabled = isEnable;
            addAnswerButton.IsEnabled = isEnable;
            if (isEnable)
            {
                saveButton.Visibility = Visibility.Visible;
                editButton.Visibility = Visibility.Collapsed;
                cancelButton.Visibility = Visibility.Visible;
                deleteButton.Visibility = Visibility.Visible;
            }
            else
            {
                saveButton.Visibility = Visibility.Collapsed;
                editButton.Visibility = Visibility.Visible;
                cancelButton.Visibility = Visibility.Collapsed;
                deleteButton.Visibility = Visibility.Collapsed;
            }
            isEnable = !isEnable;

        }

        private void EditButton_Click(object sender, RoutedEventArgs e)
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

            question = context.Questions.Include(q => q.LicenseTypes).Include(q => q.Answers).FirstOrDefault(q => q.QuestionId == question.QuestionId);

            question.LicenseTypes.Clear();
            foreach (var selectedLicenseType in lbLicenseTypes.SelectedItems)
            {
                question.LicenseTypes.Add(selectedLicenseType as LicenseType);
            }

            var answers = question.Answers.ToList();

            if(answers.Count > answerCount)
            {
                for (int i = answerCount + 1; i <= answers.Count; i++)
                {
                    var existingAnswer = answers.ElementAtOrDefault(i - 1);
                    if (existingAnswer != null)
                    {
                        context.Remove(existingAnswer);
                    }
                }
            }

            for (int i = 1; i <= answerCount; i++)
            {
                var tbAnswer = spAnswers.Children
                    .OfType<StackPanel>()
                    .Select(sp => sp.Children.OfType<TextBox>().FirstOrDefault())
                    .FirstOrDefault(tb => tb.Name == $"tbAnswer{i}");

                var cbCorrect = spAnswers.Children
                    .OfType<StackPanel>()
                    .Select(sp => sp.Children.OfType<CheckBox>().FirstOrDefault())
                    .FirstOrDefault(cb => cb.Name == $"cbCorrect{i}");

                if (tbAnswer != null && !string.IsNullOrWhiteSpace(tbAnswer.Text))
                {
                    var existingAnswer = answers.ElementAtOrDefault(i - 1);
                    if (existingAnswer != null)
                    {
                        existingAnswer.Content = tbAnswer.Text;
                        existingAnswer.CorrectAnswer = cbCorrect.IsChecked == true;
                        context.Answers.Update(existingAnswer);
                    }
                    else
                    {
                        var answer = new Answer
                        {
                            Content = tbAnswer.Text,
                            CorrectAnswer = cbCorrect.IsChecked == true
                        };
                        question.Answers.Add(answer);
                    }
                }
            }

            question.Content = tbQuestionContent.Text;
            question.QuestionTypeId = (cbQuestionType.SelectedItem as QuestionType)?.QuestionTypeId;
            question.Image = tbImage.Text;
            question.Explain = tbExplain.Text;

            context.Update(question);

            context.SaveChanges();

            MessageBox.Show("Thông tin câu hỏi đã được cập nhật thành công!");
            ListQuestionWindow listQuestionWindow = new ListQuestionWindow(account);
            listQuestionWindow.Show();
            this.Close();
        }


        private void CloseButton_Click(object sender, RoutedEventArgs e)
        {
            ListQuestionWindow listQuestionWindow = new ListQuestionWindow(account);
            listQuestionWindow.Show();
            this.Close();
        }

        private void DeleteButton_Click(object sender, RoutedEventArgs e)
        {
            MessageBoxResult result = MessageBox.Show("Bạn có chắc chắn muốn xóa câu hỏi này?", "Xác nhận xóa", MessageBoxButton.YesNo, MessageBoxImage.Warning);

            if (result == MessageBoxResult.Yes)
            {
                var deleteQuestion = context.Questions.FirstOrDefault(q => q.QuestionId == question.QuestionId);

                deleteQuestion.IsDelete = true;

                context.SaveChanges();

                MessageBox.Show("Câu hỏi đã được xóa thành công!");

                ListQuestionWindow listQuestionWindow = new ListQuestionWindow(account);
                listQuestionWindow.Show();
                this.Close();
            }
        }
    }
}
