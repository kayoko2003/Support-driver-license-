   M S B A M L   `   `   `  ����I  EDriver_License, Version=1.0.0.0, Culture=neutral, PublicKeyToken=null/clr-namespace:Driver_LicenseDriver_License  5   	   %    Driver_License.SelectExamWindow   5   	   W SPresentationCore, Version=8.0.0.0, Culture=neutral, PublicKeyToken=31bf3856ad364e35\ XPresentationFramework, Version=8.0.0.0, Culture=neutral, PublicKeyToken=31bf3856ad364e35e aSystem.Windows.Controls.Ribbon, Version=8.0.0.0, Culture=neutral, PublicKeyToken=b77a5c561934e089R NWindowsBase, Version=8.0.0.0, Culture=neutral, PublicKeyToken=31bf3856ad364e35F 9http://schemas.microsoft.com/winfx/2006/xaml/presentation     5   	   R NSystem.Xaml, Version=8.0.0.0, Culture=neutral, PublicKeyToken=b77a5c561934e089:x,http://schemas.microsoft.com/winfx/2006/xaml     5   	   @d2http://schemas.microsoft.com/expression/blend/2008     5   	   Jmc;http://schemas.openxmlformats.org/markup-compatibility/2006     5   	   .localclr-namespace:Driver_License     5   	     � Title$  SelectExamWindow��5   	   $	��579��6"   $	��400��6/    � WindowStartupLocation$ CenterScreen=�5	   	    � 
ResizeMode$ NoResize=�6.    � 	Resources 5
       �� 
TargetType �� Property �� Value3  -System.Windows.Media.Effects.DropShadowEffect   Color   
BlurRadius	   ShadowDepth
 �� 
TargetType �� CornerRadius �� Triggers P� Property P� Value �� ScaleX �� ScaleY   ButtonWithoutShadow��%G  '��       &	  P    �� 5   
   " ��6   .�5      ��  � ��$ 0q�60   �� 5       �@J�Effect 5        5      $ Black��6'   $ 10Q�65   $	 5Q�6E   5      �� 5       � �� 5      �� 5      "
 ��6&   .R�5      �� #��z��6!   $ 10��5   !   ._�5      �� $��Center=�6/   $��Center=�6L   5      5      5       5      P� 5       �@J�IsMouseOver$
 True��61   . �5      ��  � z� 5       �� 5!      $	 1.2Q�6-   $	 1.2Q�6:   5#      �� 5$       �@J�RenderTransformOrigin$ 0.5,0.5&�6>   5%      5'      �� 5)   
   " ��6,   .�5*      ��  � ��$ 0q�60   �� 5+       � �� 5,      �� 5-      "
 ��6&   .R�5.      �� #��z��6!   $ 10��5/   !   ._�50      �� $��Center=�6/   $��Center=�6L   51      52      54       55      P� 56       �@J�IsMouseOver$
 True��61   . �57      ��  � z� 58      �� 59      $	 1.2Q�6-   $	 1.2Q�6:   5;      �� 5<       �@J�RenderTransformOrigin$ 0.5,0.5&�6>   5=      5?      5@      .��5B      � .+�5C   
   � -   5         �Name$ 
ButtonGrid��5C   $   ���#195a735D      �� 5E   
   -   5         ��Name$ ButtonOpenMenu��5E      $��40��6)   $��50��65   $��5q�6@   $
��Left=�6x   $	��Top=�6�   ���	#FF31577E#��[  6�   ��6K   Z� ��6a   Z� .��5F      �� $��Images/Icon/Out.png��6   5G      5H      5I      