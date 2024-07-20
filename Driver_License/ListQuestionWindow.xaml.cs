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
    /// Interaction logic for ListQuestionWindow.xaml
    /// </summary>
    public partial class ListQuestionWindow : Window
    {
        private Account account;
        private readonly SupportLicenseContext context = new SupportLicenseContext();
        public ListQuestionWindow(Account account)
        {
            this.account = account;
            InitializeComponent();
            LoadQuestionType();
            LoadLicenseType();
        }

        private void BtnBack_Click(object sender, RoutedEventArgs e)
        {
            ListSettingWindow listSettingWindow = new ListSettingWindow(account);
            listSettingWindow.Show();
            this.Close();
        }

        private void LoadQuestionType()
        {
            var questionType = context.QuestionTypes.Include(c => c.Questions).ToList();
            questionType.Insert(0, new QuestionType { Content = "Tất cả" });
            cbQuestionType.ItemsSource = questionType;
            cbQuestionType.SelectedIndex = 0;
            cbQuestionType.DisplayMemberPath = "Content";
        }

        private void LoadLicenseType()
        {
            var LicenseType = context.LicenseTypes.Include(c => c.Questions).ToList();
            LicenseType.Insert(0, new LicenseType { Name = "Tất cả" });
            cbLicenseType.ItemsSource = LicenseType;
            cbLicenseType.SelectedIndex = 0;
            cbLicenseType.DisplayMemberPath = "Name";
        }

        private void TextBox_TextChanged(object sender, TextChangedEventArgs e)
        {
            string filter = search.Text.ToLower();

            var licenseType = cbLicenseType.SelectedItem as LicenseType;
            var questionType = cbQuestionType.SelectedItem as QuestionType;
 
            List<Question> questions;

            if (licenseType != null && questionType != null)
            {
                if (licenseType.Name == "Tất cả" && questionType.Content == "Tất cả")
                {
                    questions = context.Questions.Include(q => q.Answers).Include(q => q.LicenseTypes).Where(q => q.Content.ToLower().Contains(filter) && q.IsDelete == false).ToList();
                }
                else if (licenseType.Name == "Tất cả")
                {
                    questions = context.Questions.Include(q => q.Answers).Include(q => q.LicenseTypes).Where(q => q.QuestionTypeId == questionType.QuestionTypeId && q.Content.ToLower().Contains(filter) && q.IsDelete == false).ToList();
                }
                else if (questionType.Content == "Tất cả")
                {
                    questions = licenseType.Questions.Where(q => q.IsDelete == false).ToList();
                }
                else
                {
                    questions = licenseType.Questions.Where(q => q.QuestionTypeId == questionType.QuestionTypeId && q.Content.ToLower().Contains(filter) && q.IsDelete == false).ToList();
                }

                QuestionDataGrid.ItemsSource = questions;
            }
        }

        private void cbType_SelectionChanged(object sender, SelectionChangedEventArgs e)
        {
            var licenseType = cbLicenseType.SelectedItem as LicenseType;
            var questionType = cbQuestionType.SelectedItem as QuestionType;

            List<Question> questions;

            if (licenseType != null && questionType != null)
            {
                if (licenseType.Name == "Tất cả" && questionType.Content == "Tất cả")
                {
                    questions = context.Questions.Where(q => q.IsDelete == false).ToList();
                }
                else if (licenseType.Name == "Tất cả")
                {
                    questions = context.Questions.Where(q => q.QuestionTypeId == questionType.QuestionTypeId && q.IsDelete == false).ToList();
                }
                else if (questionType.Content == "Tất cả")
                {
                    questions = licenseType.Questions.ToList();
                }
                else
                {
                    questions = licenseType.Questions.Where(q => q.QuestionTypeId == questionType.QuestionTypeId && q.IsDelete == false).ToList();
                }

                QuestionDataGrid.ItemsSource = questions;
            }
        }

        private void DetailsButton_Click(object sender, RoutedEventArgs e)
        {
            var button = sender as Button;
            var question = button.DataContext as Question;
            if (question != null)
            {
                QuestionDetailsWindow detailsWindow = new QuestionDetailsWindow(question, account);
                detailsWindow.Show();
            }
            this.Close();
        }

        private void BtnAdd_Click(object sender, RoutedEventArgs e)
        {
            AddQuestionWindow addQuestionWindow = new AddQuestionWindow(account);
            addQuestionWindow.ShowDialog();
        }

    }
}
