   M S B A M L   `   `   `  ����I  EDriver_License, Version=1.0.0.0, Culture=neutral, PublicKeyToken=null/clr-namespace:Driver_LicenseDriver_License  5   	   #    Driver_License.PenalizeWindow   5   	   W SPresentationCore, Version=8.0.0.0, Culture=neutral, PublicKeyToken=31bf3856ad364e35\ XPresentationFramework, Version=8.0.0.0, Culture=neutral, PublicKeyToken=31bf3856ad364e35e aSystem.Windows.Controls.Ribbon, Version=8.0.0.0, Culture=neutral, PublicKeyToken=b77a5c561934e089R NWindowsBase, Version=8.0.0.0, Culture=neutral, PublicKeyToken=31bf3856ad364e35F 9http://schemas.microsoft.com/winfx/2006/xaml/presentation     5   	   R NSystem.Xaml, Version=8.0.0.0, Culture=neutral, PublicKeyToken=b77a5c561934e089:x,http://schemas.microsoft.com/winfx/2006/xaml     5   	   @d2http://schemas.microsoft.com/expression/blend/2008     5   	   Jmc;http://schemas.openxmlformats.org/markup-compatibility/2006     5   	   .localclr-namespace:Driver_License     5   	     � Title$  Các mức xử phạt��5   	   $	��579��6!   $	��400��6.    � WindowStartupLocation$ CenterScreen=�5	   	    � 
ResizeMode$ NoResize=�6.   .��5
      �  � RowDefinitions 5   
   �� 5      $
��Auto �6   �� 5      $��* �6   .+�5   
   ��  �� Orientation$ 
Horizontal=�6   ���#1b7a90$	��Top=�6C   $��50��6[   .+�5      �� -   5         ��Name$ btnBack��5      $
��auto��6&   $��30��63   
������ $��0q�6n   $��Center=�6�   $
��10,0q�6�   .��5      �� $��Images/Icon/Back.png��6   $��20��66   $��30��6A   5      �� 5      $��Các mức xử phạt��6   $��Center=�6/   
�������$��16(�6]   $
��Bold"�6k   $
��10,0q�6}   5      &   System.Windows.Controls.DataGrid  5   
   -   5          Name$ PenalizeDataGrid��5         AutoGenerateColumns$ False��6-      
IsReadOnly$
 True��6I   $��10q�6}   $��1��6�   $��Hidden=�6�   ��6[   �� *	Penalizes+	   Columns	 5      4  .System.Windows.Controls.DataGridTemplateColumn  5      ,  &System.Windows.Controls.DataGridColumn
   Header$
 
Nội dung��6)      Width5  /System.Windows.Controls.DataGridLengthConverter$ * 6;      CellTemplate 5      �� 5      .R�5      �� $
��Wrap=�6A   ��6(   �� *	Content+6A   5      5        5       $
 Mức phạt��6)   $	 150 6;    5!      �� 5"      .R�5#      �� $
��Wrap=�6?   ��6(   �� *Fines+6?   5$      5&      5(      5)      5*      