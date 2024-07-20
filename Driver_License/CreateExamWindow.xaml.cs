using System.Collections.Generic;
using System.Linq;
using System.Windows;
using System.Windows.Controls;
using Driver_License.Models;

namespace Driver_License
{
    public partial class CreateExamWindow : Window
    {
        private SupportLicenseContext context = new SupportLicenseContext();
        private List<Question> selectedQuestions = new List<Question>();
        private Account account;
        public CreateExamWindow(Account account)
        {
            this.account = account;
            InitializeComponent();
            LoadLicenseTypes();
            LoadQuestionTypes();
            LoadQuestions();
        }

        private void LoadLicenseTypes()
        {
            var licenseTypes = context.LicenseTypes.ToList();
            cbExamLicenseType.ItemsSource = licenseTypes;
            cbExamLicenseType.DisplayMemberPath = "Name";

            cbQuestionLicenseType.ItemsSource = licenseTypes;
            cbQuestionLicenseType.DisplayMemberPath = "Name";
        }

        private void LoadQuestionTypes()
        {
            var questionTypes = context.QuestionTypes.ToList();
            cbQuestionType.ItemsSource = questionTypes;
            cbQuestionType.DisplayMemberPath = "Content";
        }

        private void LoadQuestions()
        {
            var questions = context.Questions.Where(q => q.IsDelete == false).ToList();
            lbQuestions.ItemsSource = questions;
            lbQuestions.DisplayMemberPath = "Content";
        }

        private void FilterQuestions(object sender, RoutedEventArgs e)
        {
            var selectedLicenseType = cbQuestionLicenseType.SelectedItem as LicenseType;
            var selectedQuestionType = cbQuestionType.SelectedItem as QuestionType;

            var filteredQuestions = context.Questions.AsQueryable();

            if (selectedLicenseType != null)
            {
                filteredQuestions = filteredQuestions.Where(q => q.IsDelete == false && q.LicenseTypes.Any(lt => lt.LicenseTypeId == selectedLicenseType.LicenseTypeId));
            }

            if (selectedQuestionType != null)
            {
                filteredQuestions = filteredQuestions.Where(q => q.IsDelete == false && q.QuestionTypeId == selectedQuestionType.QuestionTypeId);
            }

            lbQuestions.SelectionChanged -= lbQuestions_SelectionChanged; 
            lbQuestions.ItemsSource = filteredQuestions.ToList();

            foreach (var question in selectedQuestions)
            {
                lbQuestions.SelectedItems.Add(question);
            }
            lbQuestions.SelectionChanged += lbQuestions_SelectionChanged; // Kết nối lại sự kiện
        }

        private void lbQuestions_SelectionChanged(object sender, SelectionChangedEventArgs e)
        {
            foreach (var addedItem in e.AddedItems)
            {
                if (addedItem is Question question)
                {
                    if (!selectedQuestions.Contains(question))
                    {
                        selectedQuestions.Add(question);
                    }
                }
            }

            foreach (var removedItem in e.RemovedItems)
            {
                if (removedItem is Question question)
                {
                    if (selectedQuestions.Contains(question))
                    {
                        selectedQuestions.Remove(question);
                    }
                }
            }
        }

        private void CreateButton_Click(object sender, RoutedEventArgs e)
        {
            if (string.IsNullOrWhiteSpace(tbExamName.Text))
            {
                MessageBox.Show("Vui lòng nhập tên bài kiểm tra.", "Thông báo", MessageBoxButton.OK, MessageBoxImage.Warning);
                return;
            }

            if (cbExamLicenseType.SelectedItem == null)
            {
                MessageBox.Show("Vui lòng chọn loại giấy phép cho bài kiểm tra.", "Thông báo", MessageBoxButton.OK, MessageBoxImage.Warning);
                return;
            }

            if (selectedQuestions.Count == 0)
            {
                MessageBox.Show("Vui lòng chọn ít nhất một câu hỏi.", "Thông báo", MessageBoxButton.OK, MessageBoxImage.Warning);
                return;
            }

            var newExam = new Exam
            {
                Name = tbExamName.Text,
                LicenseTypeId = (cbExamLicenseType.SelectedItem as LicenseType)?.LicenseTypeId,
                CreateBy = account.AccountId,
                IsDelete = false
            };

            foreach (var selectedQuestion in selectedQuestions)
            {
                newExam.Questions.Add(selectedQuestion);
            }

            context.Exams.Add(newExam);
            context.SaveChanges();

            MessageBox.Show("Bài kiểm tra mới đã được tạo thành công!", "Thông báo", MessageBoxButton.OK, MessageBoxImage.Information);
            ListExamWindow listExamWindow = new ListExamWindow(account);
            listExamWindow.Show();
            this.Close();
        }

        private void CloseButton_Click(object sender, RoutedEventArgs e)
        {
            ListExamWindow listExamWindow = new ListExamWindow(account);
            listExamWindow.Show();
            this.Close();
        }
    }
}
