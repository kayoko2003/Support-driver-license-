   M S B A M L   `   `   `  ����I  EDriver_License, Version=1.0.0.0, Culture=neutral, PublicKeyToken=null/clr-namespace:Driver_LicenseDriver_License  5   	       Driver_License.MainWindow   5   	   W SPresentationCore, Version=8.0.0.0, Culture=neutral, PublicKeyToken=31bf3856ad364e35\ XPresentationFramework, Version=8.0.0.0, Culture=neutral, PublicKeyToken=31bf3856ad364e35e aSystem.Windows.Controls.Ribbon, Version=8.0.0.0, Culture=neutral, PublicKeyToken=b77a5c561934e089R NWindowsBase, Version=8.0.0.0, Culture=neutral, PublicKeyToken=31bf3856ad364e35F 9http://schemas.microsoft.com/winfx/2006/xaml/presentation     5   	   R NSystem.Xaml, Version=8.0.0.0, Culture=neutral, PublicKeyToken=b77a5c561934e089:x,http://schemas.microsoft.com/winfx/2006/xaml     5   	   @d2http://schemas.microsoft.com/expression/blend/2008     5   	   Jmc;http://schemas.openxmlformats.org/markup-compatibility/2006     5   	   .localclr-namespace:Driver_License     5   	     � Title$  Log In��5      $	��579��6   $	��400��6,    � WindowStartupLocation$ CenterScreen=�5	   
    � 
ResizeMode$ NoResize=�6/   .��5
      � 
������� � RowDefinitions 5   
   �� 5      $	��200 �6   �� 5      $��* �6    � ColumnDefinitions 5   
   �� 5      $��* �6   .+�5   
   �� $��0��6   $��20q�6"   $��Bottom=�6.   .+�5      �� $��Log In License App��6   $��33(�62   $
��Bold"�6@    �� TextAlignment$ Center=�6R   $��Center=�6i   $
��Wrap=�6�   $	��190��6�   �� 5      $5��/Cố gắng lấy được bằng lái xe nhé!��6   $��12(�6A   $��Center=�6O   $��0,10,0,0q�6l   5      �� 5   
   $��1��6   $	��Top=�6"   $��Center=�6:   $	��300��6W   $��0,10,0,0q�6c   .+�5      �� $��
User name:��6   $
��Left=�6)   $��15(�6D   $
��Bold"�6R   �� 5      -   5        $��UsernameTextBox��5      $��0,0,0,10q�6-   $��Stretch=�6?   $��Center=�6]   $��25��6x   �� 5      $��	Password:��6   $
��Left=�6(   $��15(�6C   $
��Bold"�6Q   G� 5      -   5        $��PasswordTextBox��5      $��0,0,0,10q�61   $��Stretch=�6C   $��Center=�6a   $��25��6|   �� 5      -   5        $��LOG IN��5      $	��100��6&   $��0,20,0,0q�62   $��Center=�6D   6a   �� 5      $��or��6    � Cursor$
 Hand��6"   $��Center=�60   �� 5       �� Orientation$ 
Horizontal=�6   $��Center=�62   .+�5      �� -   5        $��Sign up��5      
����  �$
 Hand��6=   6K   5       5!      5"      5#      