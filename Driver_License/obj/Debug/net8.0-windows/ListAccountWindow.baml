   M S B A M L   `   `   `  ����I  EDriver_License, Version=1.0.0.0, Culture=neutral, PublicKeyToken=null/clr-namespace:Driver_LicenseDriver_License  5   	   &     Driver_License.ListAccountWindow   5   	   W SPresentationCore, Version=8.0.0.0, Culture=neutral, PublicKeyToken=31bf3856ad364e35\ XPresentationFramework, Version=8.0.0.0, Culture=neutral, PublicKeyToken=31bf3856ad364e35e aSystem.Windows.Controls.Ribbon, Version=8.0.0.0, Culture=neutral, PublicKeyToken=b77a5c561934e089R NWindowsBase, Version=8.0.0.0, Culture=neutral, PublicKeyToken=31bf3856ad364e35F 9http://schemas.microsoft.com/winfx/2006/xaml/presentation     5   	   R NSystem.Xaml, Version=8.0.0.0, Culture=neutral, PublicKeyToken=b77a5c561934e089:x,http://schemas.microsoft.com/winfx/2006/xaml     5   	   @d2http://schemas.microsoft.com/expression/blend/2008     5   	   Jmc;http://schemas.openxmlformats.org/markup-compatibility/2006     5   	   .localclr-namespace:Driver_License     5   	     � Title$  ListAccountWindow��5   	   $	��579��6#   $	��400��60    � WindowStartupLocation$ CenterScreen=�5	   	    � 
ResizeMode$ NoResize=�6.   .��5
      �  � RowDefinitions 5   
   �� 5      $
��Auto �6   �� 5      $
��Auto �6   �� 5      $��* �6   .+�5   
   ��  �� Orientation$ 
Horizontal=�6   ���#1b7a90$	��Top=�6C   $��50��6[   .+�5      �� -   5         ��Name$ btnBack��5      $
��auto��6&   $��30��63   
������ $��0q�6n   $��Center=�6�   $
��10,0q�6�   .��5      �� $��Images/Icon/Back.png��6   $��20��66   $��30��6A   5      �� 5      $"��Danh sách các tài khoản��6   $��Center=�67   
�������$��16(�6e   $
��Bold"�6s   $
��10,0q�6�   5      �� 5   
   $ 
Horizontal=�6   $��Center=�6.   $��1��6K   $��50��6X   .+�5      �� $��Tìm kiếm:��6   $��20(�6)   $
��Bold"�67   $��Center=�6I   $��0,0,10,0q�6d   �� 5      -   5         ��Name$ search��5      $��2��6&   $��30��63   $��Center=�6?   $	��200��6\   6�   5      &   System.Windows.Controls.DataGrid  5   
   -   5          Name$ AccountGrid��5         AutoGenerateColumns$ False��6(   	   
IsReadOnly$
	 True��6D   $��10q�6V   $��3��6b   $��Hidden=�6o   
   Columns
 5      4  .System.Windows.Controls.DataGridTemplateColumn  5      ,  &System.Windows.Controls.DataGridColumn   Header$ ID��6)      Width5  /System.Windows.Controls.DataGridLengthConverter$ 30 65      CellTemplate 5       �� 5!      .R�5"      �� $
��Wrap=�6C   ��6(   �� *	AccountId+6C   5#      5%        5&      $ Tài khoản��6)   $ * 6<    5'      �� 5(      .R�5)      �� $
��Wrap=�6B   ��6(   �� *
UserName+6B   5*      5,        5-      $ Email��6)   $	 200 68    5.      �� 5/      .R�50      �� $
��Wrap=�6?   ��6(   �� *Email+6?   51      53        54      $ 30 6)    55      �� 56      .R�57      �� -   5        .��58   "   �� $��Images/Icon/Bin.png��6(   $
��auto��6E   $
��auto��6R   59      5:      5<      5>      5?      5@      