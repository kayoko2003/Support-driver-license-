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
    /// Interaction logic for ListSettingWindow.xaml
    /// </summary>
    public partial class ListSettingWindow : Window
    {
        private Account account;
        public ListSettingWindow(Account account)
        {
            this.account = account;
            InitializeComponent();
            if (account.IsAdmin == true)
            {
                manage.Visibility = Visibility.Visible;
            }
        }

        private void ListQuestionButton_Click(object sender, RoutedEventArgs e)
        {
            ListQuestionWindow listQuestionWindow = new ListQuestionWindow(account);
            listQuestionWindow.Show();
            this.Close();
        }

        private void ListExamButton_Click(object sender, RoutedEventArgs e)
        {
            ListExamWindow listExamWindow = new ListExamWindow(account);
            listExamWindow.Show();
            this.Close();
        }

        private void ListPenalizeButton_Click(object sender, RoutedEventArgs e)
        {
            ListPenalizeWindow listPenalizeWindow = new ListPenalizeWindow(account);
            listPenalizeWindow.Show();
            this.Close();
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
                else if (selectedItem == ItemPractice)
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

        private void ListAccountButton_Click(object sender, RoutedEventArgs e)
        {
            ListAccountWindow accountWindow = new ListAccountWindow(account);
            accountWindow.Show();
            this.Close();
        }
    }
}
