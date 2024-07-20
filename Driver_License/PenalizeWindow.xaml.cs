using Driver_License.Models;
using System;
using System.Collections.Generic;
using System.Collections.ObjectModel;
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
    /// Interaction logic for PenalizeWindow.xaml
    /// </summary>
    public partial class PenalizeWindow : Window
    {
        private readonly SupportLicenseContext context = new SupportLicenseContext();
        private LicenseType licenseType;
        private Account account;
        public PenalizeWindow(LicenseType licenseType, Account account)
        {
            InitializeComponent();
            this.licenseType = licenseType;
            this.account = account;
            LoadData();
        }

        private void LoadData()
        {
            var penalizes = context.Penalizes.Where(p => p.LicenseTypeId == licenseType.LicenseTypeId && p.IsDelete == false).ToList();
            PenalizeDataGrid.ItemsSource = penalizes;
        }

        private void BtnBack_Click(object sender, RoutedEventArgs e)
        {
            var licenseTypeWindow = new LicenseDetailWindow(licenseType, account);
            licenseTypeWindow.Show();
            this.Close();
        }
    }
}
