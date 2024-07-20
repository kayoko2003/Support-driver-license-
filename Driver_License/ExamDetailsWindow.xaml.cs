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
    /// Interaction logic for ExamDetailsWindow.xaml
    /// </summary>
    public partial class ExamDetailsWindow : Window
    {
        private SupportLicenseContext context = new SupportLicenseContext();
        private List<Question> selectedQuestions = new List<Question>();
        private Exam exam;
        private Account account;
        public ExamDetailsWindow(Exam exam, Account account)
        {
            InitializeComponent();
            this.exam = exam;
            this.account = account;
            LoadQuestionTypes();
            LoadLicenseTypes();
            LoadQuestionTypes();
            LoadExamDetails();
        }

        private void LoadExamDetails()
        {
            var licenseType = context.LicenseTypes.FirstOrDefault(x => x.LicenseTypeId == exam.LicenseTypeId);
            tbExamName.Text = exam.Name;

            List<LicenseType> licenseTypes = context.LicenseTypes.ToList();

            cbExamLicenseType.ItemsSource = licenseTypes;
            cbExamLicenseType.DisplayMemberPath = "Name";

            cbExamLicenseType.SelectedItem = licenseType;

            
            exam = context.Exams.Include(e => e.Questions).FirstOrDefault(e => e.ExamId == exam.ExamId);
            
            var questions = exam.Questions;
            lbQuestions.ItemsSource = questions;
            lbQuestions.DisplayMemberPath = "Content";

            selectedQuestions = (List<Question>) questions;

            foreach (var question in selectedQuestions)
            {
                lbQuestions.SelectedItems.Add(question);
            }
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

        private void FilterQuestions(object sender, RoutedEventArgs e)
        {
            var selectedLicenseType = cbQuestionLicenseType.SelectedItem as LicenseType;
            var selectedQuestionType = cbQuestionType.SelectedItem as QuestionType;

            var filteredQuestions = context.Questions.AsQueryable();

            if (selectedLicenseType != null)
            {
                filteredQuestions = filteredQuestions.Where(q => q.LicenseTypes.Any(lt => lt.LicenseTypeId == selectedLicenseType.LicenseTypeId));
            }

            if (selectedQuestionType != null)
            {
                filteredQuestions = filteredQuestions.Where(q => q.QuestionTypeId == selectedQuestionType.QuestionTypeId);
            }

            lbQuestions.SelectionChanged -= lbQuestions_SelectionChanged; 
            lbQuestions.ItemsSource = filteredQuestions.ToList();

            foreach (var question in selectedQuestions)
            {
                lbQuestions.SelectedItems.Add(question);
            }

            lbQuestions.SelectionChanged += lbQuestions_SelectionChanged; 
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

        private bool isEditing = true;
        private void EditButton_Click(object sender, RoutedEventArgs e)
        {
            tbExamName.IsEnabled = isEditing;
            cbExamLicenseType.IsEnabled = isEditing;
            lbQuestions.IsEnabled = isEditing;
            if (isEditing)
            {
                filterType.Visibility = Visibility.Visible;
                EditButton.Visibility = Visibility.Collapsed;
                CancelButton.Visibility = Visibility.Visible;
                SaveButton.Visibility = Visibility.Visible;
                deleteButton.Visibility = Visibility.Visible;
            }
            else
            {
                filterType.Visibility = Visibility.Collapsed;
                EditButton.Visibility = Visibility.Visible;
                CancelButton.Visibility = Visibility.Collapsed;
                SaveButton.Visibility = Visibility.Collapsed;
                deleteButton.Visibility = Visibility.Collapsed;
            }
            isEditing = !isEditing;
        }

        private void SaveButton_Click(object sender, RoutedEventArgs e)
        {
            if (string.IsNullOrWhiteSpace(tbExamName.Text))
            {
                MessageBox.Show("Vui lòng nhập tên bài kiểm tra.");
                return;
            }

            if (cbExamLicenseType.SelectedItem == null)
            {
                MessageBox.Show("Vui lòng chọn loại giấy phép cho bài kiểm tra.");
                return;
            }

            if (selectedQuestions.Count == 0)
            {
                MessageBox.Show("Vui lòng chọn ít nhất một câu hỏi.");
                return;
            }

            exam.Questions = selectedQuestions;

            exam.Name = tbExamName.Text;
            exam.LicenseTypeId = (cbExamLicenseType.SelectedItem as LicenseType)?.LicenseTypeId;

            context.SaveChanges();

            MessageBox.Show("Thông tin bài kiểm tra đã được cập nhật thành công!");

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

        private void DeleteButton_Click(object sender, RoutedEventArgs e)
        {
            MessageBoxResult result = MessageBox.Show("Bạn có chắc chắn muốn xóa bài kiểm tra này?", "Xác nhận xóa", MessageBoxButton.YesNo, MessageBoxImage.Warning);

            if (result == MessageBoxResult.Yes)
            {
                var updateExam = context.Exams.FirstOrDefault(ex => ex.ExamId == exam.ExamId);
                if (updateExam != null)
                {
                    updateExam.IsDelete = true;

                    context.SaveChanges();

                    MessageBox.Show("Bài kiểm tra đã được xóa thành công!", "Thông báo", MessageBoxButton.OK, MessageBoxImage.Information);
                }
                else
                {
                    MessageBox.Show("Không tìm thấy bài kiểm tra để xóa.", "Thông báo", MessageBoxButton.OK, MessageBoxImage.Warning);
                }

                ListExamWindow listExamWindow = new ListExamWindow(account);
                listExamWindow.Show();
                this.Close();
            }
        }
    }
}
