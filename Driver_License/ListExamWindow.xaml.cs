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
    /// Interaction logic for ListExamWindow.xaml
    /// </summary>
    public partial class ListExamWindow : Window
    {
        private Account account;
        private readonly SupportLicenseContext context = new SupportLicenseContext();
        
        public ListExamWindow(Account account)
        {
            this.account = account;
            InitializeComponent();
            LoadLicenseType();
        }

        private void LoadLicenseType()
        {
            var LicenseType = context.LicenseTypes.Include(l => l.Exams).ToList();
            LicenseType.Insert(0, new LicenseType { Name = "Tất cả" });
            cbLicenseType.ItemsSource = LicenseType;
            cbLicenseType.SelectedIndex = 0;
            cbLicenseType.DisplayMemberPath = "Name";
        }

        private void TextBox_TextChanged(object sender, TextChangedEventArgs e)
        {
            string filter = search.Text.ToLower();

            var licenseType = cbLicenseType.SelectedItem as LicenseType;

            List<Exam> exams;

            if (licenseType != null)
            {
                if (licenseType.Name == "Tất cả")
                {
                    exams = context.Exams.Where(q => q.Name.ToLower().Contains(filter) && q.IsDelete == false).ToList();
                }
                else
                {
                    exams = context.Exams.Where(q => q.Name.ToLower().Contains(filter) && q.LicenseTypeId == licenseType.LicenseTypeId && q.IsDelete == false).ToList();
                }
                ExamDataGrid.ItemsSource = exams;
            }
        }

        private void cbType_SelectionChanged(object sender, SelectionChangedEventArgs e)
        {
            var licenseType = cbLicenseType.SelectedItem as LicenseType;

            List<Exam> exams;

            if (licenseType != null)
            {
                if (licenseType.Name == "Tất cả")
                {
                    exams = context.Exams.Where(q => q.IsDelete == false).ToList();
                }
                else
                {
                    exams = context.Exams.Where(q => q.LicenseTypeId == licenseType.LicenseTypeId && q.IsDelete == false).ToList();
                }
                ExamDataGrid.ItemsSource = exams;
            }
        }


        private void DetailsButton_Click(object sender, RoutedEventArgs e)
        {
            var button = sender as Button;
            var exam = button.DataContext as Exam;
            if (exam != null)
            {
                ExamDetailsWindow detailsWindow = new ExamDetailsWindow(exam, account);
                detailsWindow.Show();
            }
            this.Close();

        }

        private void BtnAdd_Click(object sender, RoutedEventArgs e)
        {
            CreateExamWindow createExamWindow = new CreateExamWindow(account);
            createExamWindow.Show();
            this.Close();
        }

        private void BtnBack_Click(object sender, RoutedEventArgs e)
        {
            ListSettingWindow listSettingWindow = new ListSettingWindow(account);
            listSettingWindow.Show();
            this.Close();
        }
    }
}
