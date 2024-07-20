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
    /// Interaction logic for LicenseDetailWindow.xaml
    /// </summary>
    public partial class LicenseDetailWindow : Window
    {
        LicenseType licenseType;

        Account account;
        public LicenseDetailWindow(LicenseType licenseType, Account account)
        {
            InitializeComponent();
            this.licenseType = licenseType;
            this.account = account;
            load();
        }

        public void load()
        {
            if (licenseType != null)
            {
                title.Text = "Lý thuyết bằng lái xe " + licenseType.Name;
            }

            if (account.IsAdmin == true)
            {
                manage.Visibility = Visibility.Visible;
            }

            DoExamButton.DataContext = licenseType;
            DoTheoryButton.DataContext = licenseType;
            DoBoardButton.DataContext = licenseType;
            DoShapeButton.DataContext = licenseType;
            PenalizeButton.DataContext = licenseType;
            if (account.IsAdmin == true)
            {
                manage.Visibility = Visibility.Visible;
            }
        }

        private void DoExamButton_Click(object sender, RoutedEventArgs e)
        {
            var button = sender as Button;
            if (button != null)
            {
                var selectedLicense = button.DataContext as LicenseType;
                if (selectedLicense != null)
                {
                    var selectExamWindow = new SelectExamWindow(selectedLicense, account);
                    selectExamWindow.Show();
                    this.Close();
                }
            }
        }

        private void DoTheoryButton_Click(object sender, RoutedEventArgs e)
        {
            var button = sender as Button;
            if (button != null)
            {
                var selectedLicense = button.DataContext as LicenseType;
                if (selectedLicense != null)
                {
                    var practiceWindow = new PracticeWindow(selectedLicense, 1, account);
                    practiceWindow.Show();
                    this.Close();
                }
            }
        }

        private void DoShapeButton_Click(object sender, RoutedEventArgs e)
        {
            var button = sender as Button;
            if (button != null)
            {
                var selectedLicense = button.DataContext as LicenseType;
                if (selectedLicense != null)
                {
                    var practiceWindow = new PracticeWindow(selectedLicense, 3, account);
                    practiceWindow.Show();
                    this.Close();
                }
            }
        }

        private void DoBoardButton_Click(object sender, RoutedEventArgs e)
        {
            var button = sender as Button;
            if (button != null)
            {
                var selectedLicense = button.DataContext as LicenseType;
                if (selectedLicense != null)
                {
                    var practiceWindow = new PracticeWindow(selectedLicense, 2, account);
                    practiceWindow.Show();
                    this.Close();
                }
            }
        }

        private void PenalizeButton_Click(object sender, RoutedEventArgs e)
        { 
            var button = sender as Button;
            if (button != null)
            {
                var selectedLicense = button.DataContext as LicenseType;
                if (selectedLicense != null)
                {
                    var penalizeWindow = new PenalizeWindow(selectedLicense, account);
                    penalizeWindow.Show();
                    this.Close();
                }
            }
        }

        private void ButtonOpenMenu_Click(object sender, RoutedEventArgs e)
        {
            ButtonCloseMenu.Visibility = Visibility.Visible;
            ButtonOpenMenu.Visibility = Visibility.Collapsed;
        }

        private void ButtonCloseMenu_Click(object sender, RoutedEventArgs e)
        {
            ButtonCloseMenu.Visibility = Visibility.Collapsed;
            ButtonOpenMenu.Visibility = Visibility.Visible;
        }

        private void ListViewMenu_SelectionChanged(object sender, SelectionChangedEventArgs e)
        {
            if (ListViewMenu.SelectedItem != null)
            {
                var selectedItem = ListViewMenu.SelectedItem as ListViewItem;

                if (selectedItem == ItemProfile)
                {
                    ProfileWindow profileWindow = new ProfileWindow(account);
                    profileWindow.Show();
                    this.Close();
                }
                else if (selectedItem == manage)
                {
                    ListSettingWindow listSettingWindow = new ListSettingWindow(account);
                    listSettingWindow.Show();
                    this.Close();

                }else if(selectedItem == ItemPractice)
                {
                    SelectLicenseTypeWindow selectLicenseTypeWindow = new SelectLicenseTypeWindow(account);
                    selectLicenseTypeWindow.Show();
                    this.Close();
                }

                // Deselect the item after handling
                ListViewMenu.SelectedItem = null;
            }
        }

        private void LogoutButton_Click(object sender, RoutedEventArgs e)
        {
            MainWindow mainWindow = new MainWindow();
            this.Close();
            mainWindow.Show();
        }
    }
}
