   M S B A M L   `   `   `  ����I  EDriver_License, Version=1.0.0.0, Culture=neutral, PublicKeyToken=null/clr-namespace:Driver_LicenseDriver_License  5   	   !    Driver_License.SignupWindow   5   	   W SPresentationCore, Version=8.0.0.0, Culture=neutral, PublicKeyToken=31bf3856ad364e35\ XPresentationFramework, Version=8.0.0.0, Culture=neutral, PublicKeyToken=31bf3856ad364e35e aSystem.Windows.Controls.Ribbon, Version=8.0.0.0, Culture=neutral, PublicKeyToken=b77a5c561934e089R NWindowsBase, Version=8.0.0.0, Culture=neutral, PublicKeyToken=31bf3856ad364e35F 9http://schemas.microsoft.com/winfx/2006/xaml/presentation     5   	   R NSystem.Xaml, Version=8.0.0.0, Culture=neutral, PublicKeyToken=b77a5c561934e089:x,http://schemas.microsoft.com/winfx/2006/xaml     5   	   @d2http://schemas.microsoft.com/expression/blend/2008     5   	   Jmc;http://schemas.openxmlformats.org/markup-compatibility/2006     5   	   .localclr-namespace:Driver_License     5   	     � Title$  Sign up��5   	   $	��579��6   $	��400��6'   .��5	      � 
������� � RowDefinitions 5
   
   �� 5      $	��200 �6   �� 5      $��* �6    � ColumnDefinitions 5   
   �� 5      $��* �6   .+�5   
   �� $��0��6   $��20q�6"   $��Bottom=�6.   .+�5      �� $��Sign Up License App��6   $��33(�63   $
��Bold"�6A    �� TextAlignment$ Center=�6S   $��Center=�6j   $
��Wrap=�6�   $	��190��6�   �� 5      $E��?Cảm ơn bạn đã sử dụng dịch vụ của chúng tôi!��6   $��12(�6L   $��Center=�6Z   $��0,10,0,0q�6w   5      �� 5   
   $��1��6   $	��Top=�6"   $��Center=�6:   $	��300��6W   $��0,10,0,0q�6c   .+�5      ��  �� Orientation$ 
Horizontal=�6   .+�5      �� $��Tài khoản:��6   $
��Left=�6-   $��15(�6H   $
��Bold"�6V   �� 5      -   5        $��UsernameTextBox��5      $��5,0,0,0q�61   $��Center=�6B   $	��212��6]   $��25��6i   5      �� 5      $ 
Horizontal=�6   .+�5      �� $��Email:��6   $��15(�6)   $
��Bold"�67   �� 5      -   5         ��Name$ EmailTextBox��5      $��25��61   $	��212��6=   $��34,0,0,0q�6I   5      �� 5!      $ 
Horizontal=�6   .+�5"      �� $��Giới tính:��6   $��15(�6-   $
��Bold"�6;   �� 5#      $ 
Horizontal=�6   $��10,0,0,0q�66   .+�5$      	� -   5         	�Name$ GenderRadioMale��5$   "   $	��Nam��6;    	� 	GroupName$ Gender��6I    d� 	IsChecked$
 TrueY�6\   $��0,0,10,0q�6m   	� 5%      -   5        $ GenderRadioFemale��5%   "   $
��Nữ��6=   $ Gender��6J   5&      5'      �� 5)      $ 
Horizontal=�6   .+�5*      �� $��Ngày sinh:��6   $��15(�6-   $
��Bold"�6;   (  "System.Windows.Controls.DatePicker  5+      -   5        	  Name$	 
DobTextBox��5+      $��25��62   $	��212��6>   $��3,0,0,0q�6J   5,      �� 5.      $ 
Horizontal=�6   .+�5/      �� $��Mật khẩu:��6   $
��Left=�6,   $��15(�6G   $
��Bold"�6U   G� 50      -   5        
 G�Name$
 PasswordTextBox��50      $��25��67   $��7,0,0,0q�6C   $	��211��6T   51      �� 53      $ 
Horizontal=�6   .+�54      �� $��Nhập lại MK:��6   $
��Left=�6/   $��15(�6J   $
��Bold"�6X   G� 55      -   5        $��ConfirmPasswordTextBox��55      $��0,0,0,10q�6<   $��Center=�6N   $��25��6i   $	��198��6u   56      �� 58      -   5        $��
Đăng ký��58      $	��100��6'   $��0,20,0,0q�63   $��Center=�6E   6b   �� 59      $��or��6    � Cursor$
 Hand��6"   $��Center=�60   �� 5;      $ 
Horizontal=�6   $��Center=�62   .+�5<      �� $)��#Nếu bạn đã có tài khoản |��6   �� 5=      -	   5        $�� Đăng nhập��5=      
����  �$
 Hand��6@   6N   5>      5?      5@      5A      