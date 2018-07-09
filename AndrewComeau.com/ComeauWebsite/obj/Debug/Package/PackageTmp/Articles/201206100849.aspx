<%@ Page Title="Getting in Sync - AndrewComeau.com" MetaDescription="Using recursive programming to compare directory structures in VB.NET." MetaKeywords="recursion, .NET, Visual Basic, programming, recursive, download" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="201206100849.aspx.cs" Inherits="ComeauWebsite.Articles._201206100849" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">


    <style type="text/css">
        .style2
        {
            color: #33CC33;
        }
    </style>


</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">

    <strong><span class="articletitle">Getting in Sync<br />
    </span><span class="articlesub">Using recursion to compare directories in VB.NET</span></strong>&nbsp;
    <h5>Previously featured on Drewslair.com</h5>
    <h4>Introduction</h4>
    <p>One of the advantages of being a programmer is that when you don't have a program
    that does what you need, you can often write one yourself.&nbsp; This is what
    happened the other day when I was going through my MP3 collection.&nbsp; I have
    most of my CDs ripped to disc and the collection is stored on more than one external
    drive as I've changed drives over the years.&nbsp;</p>
    <p>The problem came up when I decided that I wanted to eliminate one of the copies.&nbsp;
    I wasn't quite sure when I had stopped using one disc and started using the other
    so I was afraid that by deleting the older one, I might be losing some files that
    hadn't been transferred over.&nbsp; There are thousands of songs in the collection,
    all grouped in folders by artist and album so it would take a long time to manually
    compare.&nbsp; I thought about how I might be able to use an FTP program to sync them but I wasn't sure that would work the way I wanted it to.&nbsp;
    Finally, I thought "Hey!&nbsp; It should be a simple and useful utility to write
    in .NET so why not write my own?"</p>
	  
    <h4>
        Download Options</h4>
    This program was designed using Visual Basic 2005 and requires Microsoft's .NET 2.0 
    framework to run.&nbsp; This framework is 
    <a target="_blank" href="http://www.microsoft.com/net/">available from Microsoft</a> as an optional Windows
    update or as part of the installation package below.&nbsp; I've successfully tested the program on Windows 2000, XP and
    Vista.&nbsp;
    <br />
    <br />
     For this project, I&#39;m offering the following download options.&nbsp; <ul>
      <li>EXE Only (<a href="../Downloads/DC10EXE.zip">Download</a>) 
      50.5 KB (51,770 bytes)</li>
      <li>Installation Package (<a href="../Downloads/DC10PUB.zip">Download</a>)&nbsp; 
      273 KB (280,102 bytes)</li>
      <li>Program Code (<a href="../Downloads/DC10CODE.zip">Download</a>)&nbsp; 
      87.3 KB (89,440 bytes)</li>
    </ul>
    <p>The program code offered above is in the form of a Visual Studio 2005 
    solution which includes the main form for the application.&nbsp; This form 
    contains the bulk of the application code and the code package has been 
    tested in Visual Studio 2005 Express as well as Visual Studio 2010 
    Professional.<br />
    </p>
    <h4>
        Project Design</h4>
    I decided to do this as a Windows application with an interface that would require
    the user to enter a primary directory (i.e. <span class="dirpath">F:\My 
    Music</span>) and a second directory
    (i.e. <span class="dirpath">G:\My Music</span>) to compare to the primary.&nbsp; The program would examine all
    the subfolders and files under the primary folder and check to see if there were
    corresponding files under the comparison directory.<br />
    <br />
    <div class="fltcenter">
    <img border="0" src="../Graphics/Content/003-music.jpg" width="472" height="363">
    <p>Corresponding music stores on different drives.  They look the same ... but are they?</p>
    </div>
    <p><br />
    In the screenshot above, you can see an example of the corresponding 
        directories that this program would handle.&nbsp; Both start with a &quot;My Music&quot; 
        folder.&nbsp; The program should even be able to compare the two structures if one of 
        them exists under another folder, in other words it should be able to compare <span class="dirpath">C:\Data\My Music</span> to <span class="dirpath">F:\Music
    Collection</span> to see how the folders and files under these directories correspond.<br />
    <br />
    Some programs like FTP programs might use graphical displays to show the primary
    and secondary directories and highlight areas of the display to indicate the differences
    between the two.&nbsp; I decided a listing of which files or folders were missing
    in the secondary location would be more helpful for me and that this could be done
    through a textbox on the same form where the user entered the directories to be
    compared.<br />
    </p>
    <h4>
    Recursion</h4>
    When writing programs, it's often necessary to perform repeating operations on collections
    of items such as customer orders or invoices.&nbsp; Often, you can just iterate
    through the collection or count the items to determine how many times to perform
    the operation.&nbsp; When dealing with a hierarchy of items such as a directory
    structure where you have an unknown and varying number of levels under each branch,
    it's a different story.&nbsp; For this, the typical method is to use <span class="term"> recursive programming</span>,
    often just called recursion.&nbsp; This is a method in which one routine is designed
    to analyze the items on one level of the hierarchy, look for any sublevels and then
    call <em>itself</em> to analyze each sublevel.&nbsp; Each time the routine calls
    itself, it creates another instance of itself that works independently until it's
    finished and then returns to the instance that called it.<br />
    <br />
    To show how this program would use recursion, the hierarchy starts with the
    <span class="dirpath">F:\My Music</span>
    directory for which the recursive subroutine is called first.&nbsp; The subroutine
    looks at this directory and finds a few files which it processes by looking 
    for corresponding files in the other music collection.&nbsp; Mostly,
    though, it finds subfolders because Windows Media Player (which I use) automatically
    groups songs by artist and then by album.<br />
    <br />
    <div class="fltcenter">
    <img border="0" src="../Graphics/Content/004-elo.jpg" width="449" height="293"><br />
    </div>
    <br />
    At some point while iterating through the folders under <span class="dirpath">F:\My Music</span>, the 
    subroutine reaches the subfolder for ELO.&nbsp;
    The routine then calls <i>itself</i> to examine <span class="dirpath">F:\My 
    Music\Electric Light Orchestra</span>. &nbsp;That
    instance doesn't find any files but it does find the subfolders for the two ELO
    albums I have so <i>that</i> instance of the subroutine calls itself and creates <i>another</i>
    instance to examine the first subfolder in the list.&nbsp;
    <br />
    <br />
    At this point, we have three instances of the subroutine running; one for each of
    the following folders:<br />
    <br />
    1.)&nbsp; <span class="dirpath">F:\My Music</span> &nbsp;(waiting ...)<br />
    2.)&nbsp; <span class="dirpath">F:\My Music\Electric Light Orchestra</span>&nbsp; (waiting ...)<br />
    3.) &nbsp;<span class="dirpath">F:\My Music\Electric Light Orchestra\A New World Record</span>&nbsp; (processing)<br />
    <br />
    The third instance doesn't find any subfolders because there are none but it does
    find a file for each song on the album so it processes those, ends and returns to instance #2
    which moves on to the next subfolder it finds (<span class="dirpath">..\Electric Light Orchestra\ELO's
    Greatest Hits</span>) and calls another instance of itself to analyze that folder. &nbsp;
    When instance #2 is finished, it will return to the first instance (<span class="dirpath">F:\My 
    Music</span>)
    which will then look for another subfolder and the entire process repeats until
    there are no more folders to work with.<br />
    <h4>
        The Code</h4>
        <div class="fltcenter">
    <img border="0" src="../Graphics/Content/005-dircompare.jpg" width="561" height="453">
    </div>
    <br />
    <br />
    If you're able to examine the code for this program, you'll see that the bulk of
    the work is done in two procedures within the code for the main form; the 
    click event for the Compare button shown in the screenshot above and a method which it calls named 
    <span class="inlinecode">CompareDirectories</span>.&nbsp; The rest of the code and 
    much of the interface exists to support these&nbsp; two procedures and provide a few bells and whistles. <span class="inlinecode">CompareDirectories</span> 
    is the recursive routine that accepts a directory path as a string parameter, examines 
    that directory and then calls itself to process any subdirectories.&nbsp; 
    The only limiter on the number of&nbsp; instances that might be running at 
    one time is the number of levels to the directory structure.
    
    <pre>
    
Private Sub CompareDirectories(ByVal subDirectory As String)

<span class="codecomment">    'Count the number of files and subdirectories under this folder.</span>
    Dim noFiles As Integer = FileIO.FileSystem.GetFiles(subDirectory).Count
    Dim noFolders As Integer = FileIO.FileSystem.GetDirectories(subDirectory).Count
    Dim comparisonFile As String
    Dim fileNameOnly As String, altDirectory As String

    Try
<span class="style2">        'If there are files, process each one.
</span>        If noFiles > 0 Then
            For Each fileName As String In FileIO.FileSystem.GetFiles(subDirectory)
                <span class="style2">'Increment file count ...</span>
                fileCount += 1
                <span class="style2">'Determine file path / name of corresponding file ...</span>
                comparisonFile = dirCompare & fileName.Substring(Len(dirPrimary))
                <span class="style2">'If corresponding file does not exist, add the necessary information to the output field.
</span>                If Not FileIO.FileSystem.FileExists(comparisonFile) Then
                    fileNameOnly = FileIO.FileSystem.GetName(fileName)
                    altDirectory = comparisonFile.Substring(0, Len(comparisonFile) - Len(fileNameOnly))
                    rtbOutput.Text &= FileNotice(fileNameOnly, subDirectory, altDirectory)
                    itemsFound = True
                End If
            Next
        End If

<span class="style2">        'If there are subdirectories, display the name of each one in the status label
        'and read its subfolders.</span>
        If noFolders > 0 Then
            For Each folderName As String In FileIO.FileSystem.GetDirectories(subDirectory)
                statusMessage.Text = "Reading " & folderName
                <span class="style2">'Determine name of corresponding subfolder under the comparison directory.
</span>                altDirectory = dirCompare & folderName.Substring(Len(dirPrimary))
<strong>                </strong><span class="style2"><strong>'Recursively check subdirectories if they exist.
</strong></span><strong>                If FileIO.FileSystem.DirectoryExists(altDirectory) Then
                    CompareDirectories(folderName)</strong>
                Else
                    <span class="style2">'If the corresponding directory does not exist, add the necessary information to the output field.
</span>                    rtbOutput.Text &= DirectoryNotice(altDirectory, folderName)
                    itemsFound = True
                End If
            Next
            Application.DoEvents()
        End If
    Catch ex As Exception
        MessageBox.Show(ex.Message, "Error ...", MessageBoxButtons.OK, MessageBoxIcon.Exclamation)
    End Try

End Sub   
    </pre>
    The code makes extensive use of two elements in .NET:<br />
    <br />
    1.&nbsp; The <span class="inlinecode">
    <a target="_blank" href="http://msdn.microsoft.com/en-us/library/microsoft.visualbasic.fileio.filesystem.aspx">FileIO.FileSystem</a></span> namespace which offers a number of shared methods
    to work with files and directories on the user's machine.&nbsp; This resource 
    was introduced in version 2.0 of the .NET framework and makes it very easy to manipulate files
    and folders, especially since an instance of the class does not have to be declared.<br />
    <br />
    2.&nbsp; String manipulation.&nbsp; The <span class="inlinecode">FileIO.FileSystem</span> namespace has 
    a
    method to parse a filename from a full file path but when switching between the
    two directories specified by the user, I'm performing a function that's unique to
    this program so I still have to construct the file paths manually.&nbsp; The StringBuilder
    class is recommended for frequent string operations but in this case, I've stuck
    with the methods available through the String class since the values are small
    enough to fit on a single line.<h4>
    Validation and Error Handling</h4>
    <p>One of the important parts of putting together a user interface is validating the
    information that the user enters.&nbsp; Fortunately, on this program, there are
    only two fields to worry about, each with only two potential errors that are likely
    to happen; either the user hasn't entered a directory value or the directory entered
    doesn't exist.&nbsp; The ErrorProvider control makes it pretty easy to catch and
    alert the user if either of these happen.&nbsp; Normally, this would be done in
    the Validating event of the fields as the data was entered but since this isn't
    really a data entry form, the fields might not even receive the focus and therefore
    the Validating event won't fire.&nbsp; So, I decided to write the <span class="inlinecode"> ValidateInputs </span>
    function to carry out the validation and call it from the Click event of the Compare
    button.&nbsp; Validation is performed before any other operations are carried out.</p>
    <div class="fltcenter">
    <img border="0" src="../Graphics/Content/008-errors.jpg" width="381" height="148">
    <p>The ErrorProvider control makes it easier to validate user input and highlight problems.</p>
    </div>
    <p>There's enough error handling in the code to keep the program from crashing if something
    bizarre happens and to provide enough material for the screenshot&nbsp;I 
    <a title="Send e-mails with any comments or questions here." href="mailto:acomeau@drewslair.com?subject=Feedback - Directory Comparison program">hope to
    receive</a> if&nbsp; this program actually does throw an error.&nbsp; I thought about
    a log file but decided that would be a bit much at this point.</p>
    <h4>Watching it Grow</h4>
    <p>I meant to make this a simple program but it's amazing how features seem to present
    themselves during the course of development and suddenly the program doesn't seen
    complete without them.<br />
    <br />
    I wasn't intending to add a menu or status bar at first but the interface is
    a lot more professional with them.&nbsp; Building a menu is ridiculously easy in
    Visual Studio and it's also nice that the menu options and command buttons can be
    wired to the same events. &nbsp; If you're looking at the code, notice the 
    same code handles both the click event for the Compare button and the File / 
    Compare menu option.&nbsp; The status bar also offered a nice place to display the activity
    messages rather than putting them in a separate label control.<br />
    <br />
    Then there was the ability to save the output to a file instead of limiting the user
    to viewing it within the form.&nbsp; Once I thought of it, there just didn't seem
    to be as much point to the program without it and since I was already using a Rich
    Text Box control to display the output, it was just another couple lines of code to let
    the user save the results.</p>
    <div  class="fltcenter">
    <img border="0" src="../Graphics/Content/006-save.jpg" width="563" height="412">
    </div>
    <br />
    There are also the small&nbsp;touches like the About screen and the custom program
    icon to replace that awful generic Windows icon that Visual Studio wants to assign
    to an EXE file; the icon that suggests to me a program that should only be run by the
    operating system itself, if at all.<br />
    <br />
    Weaving new features into the code, like having the program count the files 
    processed or track whether discrepancies were actually found and telling the 
    user if they weren't, is part of the fun of programming for me.&nbsp; Still, 
    you have to draw the line somewhere.&nbsp; You have to leave something for 
    Version 2, after all.<br />
    <br />
    It's not often that something works just&nbsp; right the first time but this program
    worked surprisingly well and it wasn't long before I was able to use it to compare
    the two music directories it was designed for.&nbsp; It quickly found the 
    discrepancies
    that accounted for the size differences that Windows was reporting
    and I was happy.&nbsp; I was pleased at how fast it ran, too.<h4>Version Two</h4>
    <p>Right now, the program only determines if the files exist where they are 
    expected to, it doesn't look at the file sizes or dates to determine if it's 
    looking at two different versions of the files.&nbsp; That's probably not a 
    huge change but it takes the program to a new level so it can wait for the 
    next version.&nbsp; Actually having the program enable the user to sync 
    directories by copying files would be another step in its evolution.</p>
<p><br />
    </p>
        
</asp:Content>
<asp:Content ID="Content5" runat="server" 
    contentplaceholderid="ContentPlaceHolder3">
</asp:Content>

