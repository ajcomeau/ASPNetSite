<%@ Page Title="Moving Beyond Microsoft Access: Working with Data in Visual Studio - Comeau Software Solutions" Language="C#" MasterPageFile="~/Site.Master" 
AutoEventWireup="true" CodeBehind="moving-to-visual-studio.aspx.cs" Inherits="ComeauWebsite.Articles.moving_to_visual_studio"
 MetaDescription="A demonstration of how easy it is to use Microsoft Visual Studio and C# to work with the data in a Microsoft Access database."
 MetaKeywords="Microsoft, Visual Studio, Microsoft Access, C#, programming, database, DataGridView, dataset, data binding, Comeau, Ocala, Florida" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content4" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">

  <p><span class="articletitle">Moving Beyond Microsoft Access</span><br />
  <span class="articlesub">Using Visual Studio to Manage Your Data</span></p>

  <p>I've written a lot about 
      <a href="http://www.amazon.com/gp/product/B0061RK6VO/ref=as_li_ss_tl?ie=UTF8&camp=1789&creative=390957&creativeASIN=B0061RK6VO&linkCode=as2&tag=drewslaircom-20" 
          target="_blank">Microsoft Access</a><img src="http://ir-na.amazon-adsystem.com/e/ir?t=drewslaircom-20&l=as2&o=1&a=B0061RK6VO" width="1" height="1" border="0" alt="" style="border:none !important; margin:0px !important;" />
 over the years and still believe it's a great training ground for people who want to learn to design database applications. Its user-friendly interface provides an easy learning curve and introduction to the basics of relational databases, data entry forms and report design. It's only the beginning, however, and if you want to get serious about 
      programming, it's important to expand your skillset with tools that are in demand by potential employers and customers.</p>

  <p>One of these tools is <a href="http://www.visualstudio.com/en-us" target="_blank">Microsoft Visual Studio</a>, the development suite that provides access to the .NET family of languages including C# and VB.NET. With Visual Studio, you can create a variety of professional applications from Windows executables to websites 
      like this one, powered by ASP.NET programming. While Microsoft Access provides some impressive tools for the office power user and even some 
      full-time programmers, Visual Studio is the next step up the development ladder. It enables professional programmers to design any type of solution without being tied to a Microsoft Office installation and without the limitations of the Windows desktop. A couple quick searches of sites like CareerBuilder.com will show you the kind of jobs and salaries that knowledge of Visual Studio can lead to as opposed to Microsoft Access.</p>

  <p>One of the things that makes Access so fun to work with is the ability of users to create forms and reports just by dragging and dropping some items and changing a few settings. When contemplating a move to Visual Studio, some users might be intimidated by the idea of having to learn and write masses of code in order to do the same things but I want to show you that that's not always the case. In fact, you can create a basic form with which you can read and edit your data in around five minutes. 
      If you follow these steps, you can create a basic Windows program that can be 
      copied and run on other machines.</p>

  <p>For this demonstration, I'm going to use Visual Studio 2012 Express which is available as a 
      <a href="http://www.microsoft.com/en-us/download/details.aspx?id=34673" 
          target="_blank">free download</a> from Microsoft. Typically, I would also use 
      <a href="../Indexes/microsoft-sql-server-beginners.aspx">SQL Server 2012 Express</a> for the database and that's also a 
      <a href="http://www.microsoft.com/en-us/download/details.aspx?id=29062" 
          target="_blank">free download</a> but for this demo, I'll use a simple Access 2010 data file to show how easily Visual Studio interfaces with Access.&nbsp;</p>

  <div class="fltcenter">
    <img alt="Access 2010 table design view" 
          src="../graphics/content/moving-to-visual-studio/015-accesstable.jpg" 
          title="Access 2010 table design view showing the table to be accessed by Visual Studio." />

    <p>Figure 1 - Design view of the Access 2010 table.</p>
  </div>

  <p>Figure 1 shows the Access 2010 design view for the Contacts table which I'll use in this demo. The file itself is an Access 2010 format database called 
      &#39;Contacts.accdb&#39;.</p>

  <p>To start, open Visual Studio and create a new project by selecting the 'New Project' option from the File menu.</p>

  <div class="fltcenter">
      <a href="../Graphics/Content/moving-to-visual-studio/016-newproject.jpg" target="_blank">
    <img alt="Visual Studio 2012 New Project screen" 
          src="../graphics/content/moving-to-visual-studio/016-newproject.jpg" 
          width="500" title="Visual Studio 2012 New Project screen" /></a>
        <p>Figure 2 - Creating a new project in Visual Studio. (Click for larger view.)</p>
  </div>

  <p>Select the Windows Form application type under the language of your choice. I 
      started out with Visual Basic (now known as VB.NET) but have changed to C# for my preferred langauge and 
      since you won&#39;t see much code in this demonstration anyway, that&#39;s the language 
      I&#39;ll be using. </p>

  <p>Fill in the name of the project and the location where you want it to be created as shown in Figure 2 and then click the 'OK' button to create the project. Visual Studio will take a moment to create the solution and its files and then you should see a screen something like the one shown in Figure 3.</p>

  <div class="fltcenter">
      <a href="../Graphics/Content/moving-to-visual-studio/017-projectstart.jpg" target="_blank">
    <img alt="Visual Studio IDE" 
          src="../graphics/content/moving-to-visual-studio/017-projectstart.jpg" 
          width="500" 
          title="The Visual Studio IDE includes some of the same features as the Microsoft Access environment." /></a>

    <p>Figure 3 - Visual Studio IDE (Click for larger view.)</p>
  </div>

  <p>While this looks different from the Microsoft Access environment that you might be used to, the Visual Studio IDE (Integrated Development Environment) is really not complicated once you understand the individual parts:</p>

  <ol>
    <li>Just like in Access, you can drag and drop controls onto the form that you're building and the panel on the left shows the Toolbox with these controls grouped into various categories. If this panel is not showing, you can select it from the View menu at the top of the screen.&nbsp;<br /></li>

    <li>Under the Toolbox is the Data Sources panel which shows the databases and other data sources that are currently available to use in projects. Visual Studio can work with a variety of different types of data from SQL Server to text files. Microsoft Access is also a recognized format. The individual sources need to be defined in the project before the projects can work with them.<br /></li>

    <li>The panel on the top right of the screen shows the files that make up the project with 'Form1.cs' being the form that 
        I&#39;ll be working with in this demo. The project that I just created is stored within a Visual Studio solution which can contain a number of projects which can work together.<br /></li>

    <li>On the bottom right of the screen is the Properties panel which shows the properties, settings and events for whatever object is active at the time. It's very similar to the Microsoft Access properties panel but you'll find a lot more available options.<br /></li>

    <li>In the center, just like in Access, is the form design environment where you can drop controls and configure them for use in the form.<br /></li>
  </ol>

  <h3>Defining the Data Source</h3>

  <p>We'll start by creating the data source for the Access database to be used in the 
      application. There are a couple of ways to do this and often it would be done on the Data Sources panel by creating a connection to the source. 
      Since this is a local Access file, however, I want to make the database file 
      itself part of the project so that a copy of the database can be easily distributed with the 
      finished program. To add a file to the project, right-click the project title 
      under the Solution Explorer and select 
      &#39;Add&#39; &gt;&gt; &#39;Existing Item&#39; from the menu that appears or use the SHIFT-ALT-A keyboard shortcut to open the 
      &#39;Add Existing Item&#39; screen. Then select the Access file that you want to work with. You might need to specify that you want to view 'All Files'. Select the file and click the 'Add' button to add it to the project.</p>

  <div class="fltcenter">
      <a href="../Graphics/Content/moving-to-visual-studio/018-newitem.jpg"  target="_blank">
    <img alt="Add Existing Item dialog from Visual Studio" 
          src="../graphics/content/moving-to-visual-studio/018-newitem.jpg" width="500" 
          title="Adding an existing item to a Visual Studio project, in this case a Microsoft Access file." /></a><br />

    <p>Figure 4 - Adding the Access file to the project. (Click for larger view.)</p>
  </div>

  <p>Even if you don't have Microsoft Access installed, Visual Studio should recognize the file as an Access file and display the screen in Figure 5.</p>

  <div class="fltcenter">
      <a href="../Graphics/Content/moving-to-visual-studio/019-datamodel.jpg"  target="_blank">
    <img alt="Data Source Configuration Wizard from Visual Studio" 
          src="../graphics/content/moving-to-visual-studio/019-datamodel.jpg" width="500" 
          title="Visual Studio recognizes the Access file and creates a dataset that will represent the data within the application."/></a><br />

    <p>Figure 5 - Visual Studio recognizes the Access file and creates a dataset that 
        will represent the data within the application. (Click for larger view.)</p>
  </div>

  <p>At this point, Visual Studio will ask if you want to create a dataset for the tables it found in the Access database. 
      Depending on the type of database that you&#39;re working with, there might be more 
      than one option on this screen. In this case, the dataset is what Visual Studio will use to 
      represent the database and its tables within the application. I 
      <a href="using-typed-datasets.aspx" target="_blank">wrote about typed datasets</a> in another article 
      which will provide you more details about them. For now, just click Next and you should see the screen in Figure 6.<br /></p>

  <div class="fltcenter">
      <a href="../Graphics/Content/moving-to-visual-studio/020-objects.jpg" target="_blank">
    <img alt="Visual Studio Data Source Configuration Wizard" 
          src="../graphics/content/moving-to-visual-studio/020-objects.jpg" width="500" 
          title="In the process of creating a dataset in Visual Studio, you can select the objects from the database to be represented." /></a>

    <p>Figure 6 - In the process of creating a dataset in Visual Studio, you can select 
        the objects from the database to be represented. (Click for larger view.)</p>
  </div>

  <p>You can choose which tables or queries from the Access database to reference in 
      the application. In this case, I just want the Contacts table and I'm accepting the name 
      &#39;ContactsDataSet&#39;. Once you click the 'Finish' button, the dialog will close and you'll see a new dataset object under the Solution Explorer by whatever name you choose.</p>

  <p>Now that the data is in place, the next step is to create the controls on the form that will display the data. From the Toolbox on the left side of the IDE, select the 'Data' category and then select the DataGridView and drag it over to the form as shown in Figure 7.</p>

  <div class="fltcenter">
      <a href="../Graphics/Content/moving-to-visual-studio/021-datagrid1.jpg" target="_blank">
    <img alt="Adding a DataGridView control to a Windows form in Visual Studio 2013." 
          src="../graphics/content/moving-to-visual-studio/021-datagrid1.jpg" width="500" 
          title="Adding a DataGridView control to a Windows form in Visual Studio 2013." /></a>

    <p>Figure 7- Adding a DataGridView control to a Windows form in Visual Studio 2013. (Click for larger view.)</p>
  </div>

  <p>On the top-right corner of the new DataGridView object, click on the small arrow icon to open the settings menu for the object. The first item on the menu enables you to choose the data source for the form and, in Figure 8, you can see how the list drills down to the ContactsDataSet I just created and then to the Contacts table within it.&nbsp;</p>

  <div class="fltcenter">
      <a href="../Graphics/Content/moving-to-visual-studio/022-gridsource.jpg" target="_blank">
    <img alt="Setting the data source for a DataGridView control in Visual Studio 2013." 
          src="../graphics/content/moving-to-visual-studio/022-gridsource.jpg" 
          width="500" 
          title="The DataGridView control can access the dataset created earlier and the objects within it." /></a>

    <p>Figure 8 - The DataGridView control can access the dataset created earlier and 
        the objects within it. (Click for larger view.)</p>
  </div>

  <p>Selecting the Contacts table will bind that table in the dataset to the form's DataGridView control. As shown in Figure 9, 
      the DataGridView now shows the field names from the table and Visual Studio adds a few objects 
      in the form design area. These are data objects that are used to manage the 
      various phases of communication between the controls on the form and the 
      database. They cannot be visually represented on the form itself so Visual Studio adds these icons to enable their settings to be managed as needed.<br /></p>

  <div class="fltcenter">
    <img alt="Setting the data source for the DataGridView control automatically creates objects which manage the flow of data between the databse and the application." 
          src="../graphics/content/moving-to-visual-studio/023-boundgrid.jpg" 
          title="Setting the data source for the DataGridView control automatically creates objects which manage the flow of data between the databse and the application." />

    <p>Figure 9 - Setting the data source for the DataGridView control automatically 
        creates objects which manage the flow of data between the databse and the 
        application.</p>
  </div>

  <ul>
    <li>The contactsDataSet <em>object</em> shown in Figure 9 is an instance of the ContactsDataSet 
        <em>class</em> that was created earlier. It&#39;s specific to this form and holds the actual data 
        that the form will work with.<br /></li>

    <li>The BindingSource object is used to manage the communication between the controls and the dataset. 
        It enables a control to bind directly to a specific field or table and its settings determine whether records can be added or edited. 
        The BindingSource also maintains the control's pointers to the current record within the dataset.<br /></li>

    <li>Finally, the TableAdapter manages the communication between the program and the actual database, in this case the Access file. It includes the connection information and queries that are used to read and write data.<br /></li>
  </ul>

  <p>This is a little more detail than you needed to deal with when designing a Microsoft Access database but again, it's not that complicated once you know how the parts work together. Figure 10 shows the components that you've seen so far and how they interact.</p>

  <div class="fltcenter">
      <a href="../Graphics/Content/moving-to-visual-studio/024-flow.jpg" target="_blank">
    <img alt="A flowchart showing the data objects within a .NET database application and the flow of data between them." 
          src="../graphics/content/moving-to-visual-studio/024-flow.jpg" width="500" 
          title="A flowchart showing the data objects within a .NET database application and the flow of data between them.\" /></a>

    <p>Figure 10 - A flowchart showing the data objects within a .NET database 
        application and the flow of data between them. (Click for larger view.)</p>
  </div>

  <h3>Adding a Navigation Bar</h3>

  <p>Data grids are a bit easier to navigate if there's a navigation bar to zip between the first and last records, add new records, etc.. With what you've seen so far, this is a snap because the navigation bar is just another form control that uses a 
      BindingSource to access the data in the dataset.</p>

  <p>From the Toolbox, select the BindingNavigator control and drag it to the top of 
      the form. It will automatically snap into position just under the title bar as 
      shown in Figure 11.</p>

  <div class="fltcenter">
      <a href="../Graphics/Content/moving-to-visual-studio/025-navbar.jpg" target="_blank">
    <img alt="A navigation bar can be added to the form and this will make it easier to move between records. " 
          src="../graphics/content/moving-to-visual-studio/025-navbar.jpg" width="500" 
          title="A navigation bar can be added to the form and this will make it easier to move between records. " /></a>

    <p>Figure 11 - A navigation bar can be added to the form and this will make it 
        easier to move between records. (Click for larger view.)</p>
  </div>

  <p>Next, select the new navigation bar and find the Binding Source property for the 
      bar under the Properties panel. This needs to be changed to match the BindingSource of the 
      DataGridView control so that both the grid and the bar are bound to the contactsDataSet object.</p>

  <div class="fltcenter">
    <img alt="Setting the BindingSource for the navigation bar to match that of the DataGridView keeps the two in sync." 
          src="../graphics/content/moving-to-visual-studio/026-barproperties.jpg" 
          title="Setting the BindingSource for the navigation bar to match that of the DataGridView keeps the two in sync." />

    <p>Figure 12 - Setting the BindingSource for the navigation bar to match that of the 
        DataGridView keeps the two in sync.</p>
  </div>

  <p>Once this is done, the navigation bar and data grid will be bound to the same data source 
      and synced to the same current record by the contactsBindingSource. You can try running the application by pressing F5 or clicking the Start button on the toolbar. When the form loads, play around with both the navigation bar and the grid and notice how changing the record in one will change the other. You can also click on the column headers to sort the table by that column.</p>

  <div class="fltcenter">
    <img alt="The finished data form running in Windows." 
          src="../graphics/content/moving-to-visual-studio/027-apprun.jpg" 
          title="The finished data form running in Windows." />

    <p>Figure 13 - The finished data form running in Windows.</p>
  </div>

  <p>So, at this point, working with your data in Visual Studio comes down to seven simple steps without a single line of code written:</p>

  <ol>
    <li>Create a new project.<br /></li>

    <li>Specify a data source and use the wizard to generate a dataset.<br /></li>

    <li>Add a datagrid control to your form.<br /></li>

    <li>Set the datagrid's data source to the appropriate table within the dataset that you created. Visual Studio will create the necessary data objects on the form.<br /></li>

    <li>Add a navigation bar.<br /></li>

    <li>Set the navigation bar's BindingSource to match the datagrid's BindingSource so that the two are in sync.<br /></li>

    <li>Run the application.<br /></li>
  </ol>

  <h3>Saving Your Changes</h3>

  <p>Being able to view the data is great but you'll also want to make changes and save those changes back to the database. This is where you'll write your first code but it's only a couple of lines.</p>

  <p>First, create a button on your new form under the data grid by dragging a Button control over from the 'All Windows Forms' category on the Toolbox. You'll use this button to save the data after any changes.</p>

  <p>You can assign names to any objects or controls you create in Visual Studio. I haven't bothered with specific names to this point but go ahead and set the 'Name' property for the new button to 'cmdSave' and set the Text property to 'Save Changes'. You can resize the button if all of the text does not display.</p>

  <div class="fltcenter">
    <img alt="Adding a command button in Visual Studio" 
          src="../graphics/content/moving-to-visual-studio/028-button.jpg" 
          title="Adding a command button to save the changes made to the data displayed in the grid." />

    <p>Figure 14 - Adding a command button to save the changes made to the data 
        displayed in the datagrid.</p>
  </div>

  <p>To add the necessary code, just double click on the new button. The code environment will appear and a new Click event will be 
      automatically created for the button. Change the event so it appears as follows:</p>

  <p class="code">private void cmdSave_Click(object sender, EventArgs e)<br />
  {<br />
  &nbsp; &nbsp; &nbsp;contactsBindingSource.EndEdit();<br />
  &nbsp; &nbsp; &nbsp;contactsTableAdapter.Update(this.contactsDataSet);<br />
  &nbsp; &nbsp; &nbsp;MessageBox.Show("Changes saved successfully.", "Saved ...");<br />
  }</p>

  <p>That's all the code that's actually needed and even the third line is only a courtesy to notify the user that the changes are saved. Of course, this doesn't include such things as error handling and comments which are important to learn as you work with Visual Studio.</p>

  <p>In order to test the Save Changes button, you need to do something slightly different to run it. From the Project menu at the top of the screen, select 
      &#39;Show All Files&#39; or click the corresponding icon at the top of the Solution Explorer. In the Solution Explorer panel, you'll notice a couple new items appear.</p>

  <div class="fltcenter">
    <img alt="Visual Studio uses the 'bin' folder within the project to store the build files for the application." 
          src="../graphics/content/moving-to-visual-studio/029-bin.jpg" 
          title="Each time Visual Studio builds the application, a new executable file is created in either the Debug or Release subfolder of the bin folder, along with supporting files." />

    <p>Figure 15 - Each time Visual Studio builds the application, a new executable file 
        is created in either the Debug or Release subfolder of the bin folder, along 
        with supporting files.</p>
  </div>

  <p>Although the Access database is included in the project itself, the changes are not actually being made in that copy of the database. Whenever you run the application in Visual Studio, a new EXE file is built for your program in either the Debug or Release folder depending on which on you select in 
      the Configuration Manager screen, which you can select from the Build menu in Visual Studio. Visual Studio also copies the Access database to this folder and runs the EXE which makes the changes to <i>that</i>&nbsp;copy of the database.&nbsp;</p>
    <p>The reason for the Debug and Release configurations is so that programs can be tested with code that will run in Debug mode but be inactive when the developer switches to Release mode. Visual Studio also optimizes the code for distribution to other users when it's built under Release mode. Visual Studio defaults to the Debug configuration for a new project so right-click the Debug folder in the Solution Explorer and select the 'Open Folder in File Explorer' option. This will show you the folder as it exists in Windows. You can also navigate to it through Windows by opening the folder where you saved your solution when you created it.</p>

  <div class="fltcenter">
      <a href="../Graphics/Content/moving-to-visual-studio/030-folder.jpg" target="_blank">
    <img alt="The project's build files can be accessed through Windows Explorer." 
          src="../graphics/content/moving-to-visual-studio/030-folder.jpg" width="500" 
          title="The project's build files can be accessed through Windows Explorer." /></a>

    <p>Figure 16 - The project&#39;s build files can be accessed through Windows Explorer. (Click for larger view.)</p>
  </div>

  <p>Now, to run the program and ensure that it's saving the changes, just double-click on the EXE file, 
      double-click on any of the cells to edit them, make a few changes and then click 
      the Save button. If you close the program and re-run it, your changes should 
      still be there. Because you're running the compiled executable instead of instructing Visual Studio to 
      build a new one, it will make the changes to the existing database right there in the 
      same directory as the EXE file. Of course, they'll be overwritten the next time you build the EXE from Visual Studio so if you want to keep changes you make while testing, be sure to copy the database elsewhere.</p>

  <h3>Distributing your Program</h3>

  <p>When you build your program under the Release configuration, the EXE that is created in the Release folder is actually the finished product intended for distribution and deployment. One of the advantages of using Visual Studio is that, so long as someone has the .NET framework installed on their machine, you can very often 
      just copy the EXE and any supporting files you need to a folder on that machine, create a shortcut and you're in business. In the case of the program above, it would just be 'Contacts.exe' and 'Contacts.accdb'. There is also a Publish command from the Build menu in Visual Studio that will publish your application with an installation program that can be run in order to install it on another machine. You can learn more about this by researching 'ClickOnce deployment'.</p>

  <h3>Conclusion</h3>
    <p>Of course, there&#39;s a lot more to building and deploying professional applications 
        with Visual Studio than shown here but by following the steps in this article 
        and exploring some of the settings available, you should get at least a 
        beginning comfort level with the Visual Studio environment. There are also tons of 
        articles and tutorials online to support programmers at all levels so don&#39;t be 
        afraid to jump right in. Also keep checking back here for more articles on other 
        aspects of Visual Studio.<br /></p>
       <div class = "bookdesc">
    <h4>For more information on Visual Studio and C# 2012</h4>
    <p>
        <a href="http://www.amazon.com/gp/product/0735668019/ref=as_li_ss_il?ie=UTF8&camp=1789&creative=390957&creativeASIN=0735668019&linkCode=as2&tag=drewslaircom-20"><img border="0" src="http://ws-na.amazon-adsystem.com/widgets/q?_encoding=UTF8&ASIN=0735668019&Format=_SL160_&ID=AsinImage&MarketPlace=US&ServiceVersion=20070822&WS=1&tag=drewslaircom-20" ></a><img src="http://ir-na.amazon-adsystem.com/e/ir?t=drewslaircom-20&l=as2&o=1&a=0735668019" width="1" height="1" border="0" alt="" style="border:none !important; margin:0px !important;" /><a href="http://www.amazon.com/gp/product/0735668019/ref=as_li_ss_tl?ie=UTF8&camp=1789&creative=390957&creativeASIN=0735668019&linkCode=as2&tag=drewslaircom-20">Microsoft Visual C# 2012 Step by Step (Step By Step (Microsoft))</a><img src="http://ir-na.amazon-adsystem.com/e/ir?t=drewslaircom-20&l=as2&o=1&a=0735668019" width="1" height="1" border="0" alt="" style="border:none !important; margin:0px !important;" />

    <br><span class="author">John Sharp</span>
    </p>
       Available on <a target="_blank" href="http://www.amazon.com/?_encoding=UTF8&camp=1789&creative=390957&linkCode=ur2&tag=drewslaircom-20">Amazon.com</a><img src="https://ir-na.amazon-adsystem.com/e/ir?t=drewslaircom-20&l=ur2&o=1" width="1" height="1" border="0" alt="" style="border:none !important; margin:0px !important;" /><br />
       <br />
       <a href="http://www.amazon.com/gp/product/B00ARN9MG8/ref=as_li_ss_tl?ie=UTF8&camp=1789&creative=390957&creativeASIN=B00ARN9MG8&linkCode=as2&tag=drewslaircom-20">Kindle edition</a><img src="http://ir-na.amazon-adsystem.com/e/ir?t=drewslaircom-20&l=as2&o=1&a=B00ARN9MG8" width="1" height="1" border="0" alt="" style="border:none !important; margin:0px !important;" /> also available.

        <p>&nbsp;</p>

    </div>

  


</asp:Content>
