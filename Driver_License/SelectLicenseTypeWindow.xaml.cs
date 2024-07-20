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
    /// Interaction logic for SelectLicenseTypeWindow.xaml
    /// </summary>
    public partial class SelectLicenseTypeWindow : Window
    {
        private Account account;
        private readonly SupportLicenseContext context = new SupportLicenseContext();
        public SelectLicenseTypeWindow(Account account)
        {
            InitializeComponent();
            this.account = account;
        }
       
        private void Window_Loaded(object sender, RoutedEventArgs e)
        {
            Load_Type_License();
            if(account.IsAdmin == true)
            {
                manage.Visibility = Visibility.Visible;
            }
        }

        public void Load_Type_License()
        {
            var type = context.LicenseTypes.ToList();
            dgLiencesType.ItemsSource = type;
        }

        private void DetailsButton_Click(object sender, RoutedEventArgs e)
        {
            var button = sender as Button;
            if (button != null)
            {
                var selectedLicense = button.DataContext as LicenseType;
                if (selectedLicense != null)
                {
                    var licenseTypeWindow = new LicenseDetailWindow(selectedLicense, account);
                    licenseTypeWindow.Show();
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
                }else if(selectedItem == manage)
                {
                    ListSettingWindow listSettingWindow = new ListSettingWindow(account);
                    listSettingWindow.Show();
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
