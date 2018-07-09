<%@ Page Title="Looking for Square Pegs - AndrewComeau.com" MetaDescription="Designing algorithms to solve programming challenges.  A step by step look at how solutions are turned into code.  Features C# code and an online demo." MetaKeywords="C#, algorithm, .NET, visual studio, programming, software, development" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="201206051547.aspx.cs" Inherits="ComeauWebsite.Articles._201206051547" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <style type="text/css">
        .style1
        {
            width: 100%;
        }
        .style2
        {
            width: 463px;
        }
    .style3
    {
        width: 256px;
    }
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">

    <strong><span class="articletitle">Looking for Square Pegs<br />
    </span><span class="articlesub">Finding a solution and turning it into code</span></strong><br />

    <h4>
    Introduction</h4>
    

    <p>
    Programming and software development is a type of engineering. More than 
    just sitting down and typing code, it's about designing solutions to 
    everyday problems using technical knowledge gained over years of training 
    and experience. Larger projects can include a series of challenges to solve, 
    some of which can't be foreseen until they're staring you right in the face 
    and laughing at your project deadlines.</p>
    

    <p>
    Being a software developer is more about being able to solve problems than 
    it is about what languages or tools you know just like being a carpenter is 
    about more than knowing how to use a hammer or a saw.&nbsp; Programming 
     
    technologies come and go and a skilled programmer can pick up 
    a new one in a short time.&nbsp; Being able to evaluate the requirements of 
    a project, break them down into a series of tasks and come up with a robust 
    solution is a much more valuable skill.&nbsp; Without that, mastery of a 
    dozen langauges would be next to useless. </p>
    

    <p>
    For coding challenges, this series of tasks is 
    often called an algorithm.&nbsp; Algorithms are logical methods used to 
    accomplish a specific objective.&nbsp; They can be written out in plain English 
    (or any other human language) as a list of steps and decisions that must be 
    followed in order to achieve the desired result.</p>
    

    <p>
        A recent experience with this was a small problem that I had to solve as 
    part of a  project I was working on and the problem was this: How do you 
    program a comparison of three or more text values and make sure they're all the same?&nbsp; 
    For two values, it's easy; you use an IF ... THEN statement and an equality operator 
    (= or ==, depending on the language) or, in 
    <a target="_blank" href="http://en.wikipedia.org/wiki/.NET_Framework">the .NET 
    languages</a>, you could use the 
    <a target="_blank" href="http://msdn.microsoft.com/en-us/library/system.string.compare.aspx">String.Compare</a> function which compares one 
    string to another.&nbsp; Three or more values starts getting more complex, 
    especially if the number of items to be compared 
    changes to four or more. It&#39;s also best if the code returns more than a 
    TRUE / FALSE value.&nbsp; If the values don't match, there needs to be some 
    indicator of what went wrong.</p>
    

    <p>
    I could just throw a bunch of code on the page showing how I solved this 
    problem and the average programmer could analyze the algorithm from it 
    pretty quickly and then even more quickly tell me how I could have done it 
    better. (Programmers like to do that to each other; it's almost a 
    compulsion.) As this article is meant for people who are relatively new to 
    programming, I'd rather take you through the process and see how I came to 
    the solution.</p>
    

    <h4>
    How Big of a Hammer Do We Need?</h4>
    

    <p>
    One of the first things to determine is the scope of the problem and the 
    size of the needed solution. Often this means asking how many users will be 
    working with the program or how many machines it will be running on.
    <a target="_blank" title="Courtesy of Flickr.com.  Click for original photo." href="http://www.flickr.com/photos/backdoorsurvival/6895075728/"> 
    <img border="0" src="../Graphics/Content/009-hammer.gif" width="151" height="225" align="right"></a>How 
    many different systems will be affected?&nbsp; How much data will be moved 
    and stored?&nbsp;Is this a repetitive process that needs to be especially 
    efficient because of how often it will run? This can make the difference between a small program that can be worked up in a day or two and an enterprise 
    solution designed by a team of programmers that takes a couple of months to 
    plan, build and test.</p>
    

    <p>
    On a lower level like this one, it's just a question of how much code is 
    needed and how it should be organized within the program.&nbsp; In this 
    case, a single function should do it. That function will, of course, be part 
    of a larger program in the end but for now we're focusing on this one task.</p>
    

    <p>
    Since it is a self-contained function, my next thought is about code reuse.&nbsp; 
    If I'm going to take the time to write a specialized function, I'm going to 
    design it so that it can be reused or adapted elsewhere when needed, if 
    possible by just copying it from one program into another and calling it.&nbsp; 
    In a sense, functions should behave as much as possible like interchangeable 
    parts in any system. If I was 
    talking about the parts of a stereo system, the first thing I'd consider 
    after the function of the component itself is it's <i>connections</i>.&nbsp; 
    What kind of inputs does it have for external devices and how will it output 
    its signal to the speakers or other systems?&nbsp; Again, the same questions 
    are asked when writing code.</p>
    

    <p>
    With functions, the inputs take the form of the values that can be passed to 
    it as <i>arguments</i>.&nbsp; The function will use these values during its 
    calculations. In this case, the function will need to accept a list of text 
    values to compare to each other.&nbsp; That list could be passed in a number 
    of ways; as an array of strings or a collection object specific to the .NET 
    framework.&nbsp; Sometimes, there could be reasons to use a type of input 
    that's specific to a given programming technology but right now, I 
    want the code to be adaptable. I'm going to use the simple choice of a 
    <span class="term">delimited string</span>; text that includes more than one 
    value separated by a specific character.&nbsp; 
    <a target="_blank" href="http://en.wikipedia.org/wiki/Comma-separated_values">Comma Separated Values (CSV)</a> 
        in which each value is separated by a comma is the most common. Spaces and 
    semi-colons could also be used. The input might look something like this:</p>
    

    <p align="center">
    <font face="Courier New">1234,1234,1234,1235,1234</font></p>
    

    <p>
    A one-dimensional string
    <a target="_blank" title="More about arrays on Drewslair.com." href="http://www.drewslair.com/desk/vba_intro/005-arrays.shtml">array</a> would be my next choice. With an array, the 
    values are pre-formatted so that the function can examine all the 
    values in sequence.&nbsp; Since I'm designing with C#, however, there's a simple 
    function that I can use to create such an array from the CSV shown above so 
    I'll let my function do that step as well and make the input a little 
    simpler.</p>
    

    <div class="fltcenter">
    <a target="_blank" href="http://www.flickr.com/photos/jeezny/3618394418/">
    <img border="0" src="../Graphics/Content/010-connections.gif" width="319" height="220"></a>
    <p>When writing code, it sometimes helps to think of how other technologies 
    work. The inputs and outputs of a function could be compared to the 
    connections on a stereo system or other device with interchangeable parts. 
    (Photo from Flickr.com. Uploaded by
    <a target="_blank" href="http://www.flickr.com/photos/jeezny/3618394418/">
    Jeezny</a>.)</div>
    

    <p>
    The output of the function is a bigger question. The requirement states that 
    PASS / FAIL is not enough; if not all the values match, there has to be some 
    indication of why. I also like outputs that can be used in more ways than 
    one so I decided to return a list of the distinct values within the 
    delimited string.&nbsp; The code that calls this function can then use that 
    list in whatever way it wants or simply count the number of list items.&nbsp; 
    If there's more than one, it means there was no match.</p>
    

    <p>
    The next question is how will the function format that list? The function's 
    output is more easily changed when and if it's re-used so I'm going to 
    choose an output based on what works for the program that the function is 
    part of right now.&nbsp; At first, I was going to return it 
    as a string array that could be easily enumerated in 
    code.&nbsp; The problem is that string arrays need to&nbsp;be declared with 
    a specific number of items in C# and are not easily resized which is a 
    problem since I don't know how many values I'll find. After searching some more, I 
    settled on the 
    <a title="More about the Generic List class on MSDN" href="http://msdn.microsoft.com/en-us/library/6sh2ey19.aspx">Generic List</a>  class where the individual values are 
    easily referenced and counted by the calling code.</p>
    

    <h4>
    Devising the Plan</h4>
    

    <p>
    Once we know what the function is accepting and returning, we need to figure 
    out how it will arrive at the result. This is the step that gets easier with 
    experience but there can still be some trial and error involved.</p>
    

    <p>
    One of the often-repeated truths of programming is that there is more than 
    one way to accomplish most tasks, often several ways.&nbsp; Programming 
    languages are getting more powerful every year and often reduce the amount 
    of custom code that it takes to accomplish any given task.&nbsp; When it comes down to 
        it, though, a programmer is going to use the methods that are the easiest to 
        remember and understand given the time available to think through a problem 
    and maybe his or her
    <a target="_blank" href="http://www.thinkgeek.com/brain/whereisit.cgi?t=coffee&x=0&y=0">
    caffeination level</a>.&nbsp; There will always be room for improvements 
    but the first priority is often getting the job done.</p>
    

    <p>
    With this function, I know that I have a delimited list and I 
    know that I can split it into an array to make it easier to work with the 
    values so that's my first step in the algorithm.&nbsp; I need to go from 
    &quot;<font face="Courier New">1234,1234,1234,1235,1234&quot; to:</font></p>
    

    <p>
    <font face="Courier New">[0] = 1234<br>
    [1] = 1234<br>
    [2] = 1234<br>
    [3] = 1235<br>
    [4] = 1234</font></p>
    

    <p>
    <font face="Courier New">(</font>Remember that arrays in C# are zero-based 
    so the numbering of the elements starts with 0.)</p>
    

    <p>
        1. Split the input string into an array.</p>
    

    <p>
    I also know that I need to define the Generic.List that the function will 
    build and return.</p>
    

    <p>
    2. Declare a return list.</p>
    

    <p>
    So now I have an array of values to check and an empty return list.&nbsp; 
    Now the question is how I'm going to check the array for duplicates.&nbsp; 
    Sometimes the best way is to start with how a human would do it and be glad 
    a computer can use the same method hundreds of times faster.</p>
    

    <p>
    If you were manually checking a list to verify everything matched, your 
    method would depend on the length of a list and what you were checking.&nbsp; 
    A list of five items or less could be verified at one sweeping glance.&nbsp; 
    If you had more than five items, you might look for one item that you knew 
    was correct and compare everything to that.&nbsp; This function checks a 
    list of indefinite length and doesn't have a reference value to work with so 
    the next method is to compile the list of distinct values ... one at a time.</p>
    

    <p>
    3.&nbsp;Add the first value in the input array to the return list.</p>
    

    <p>
    After all, the first value in the input array is unique so far so that makes 
    a good start.&nbsp; Now I need to start moving through the input array and 
        looking for discrepancies.&nbsp; To do that, I use the return list as the 
    reference value(s) to check against.</p>
    

    <p>
    4.&nbsp;&nbsp;Check the next item in the input array.&nbsp;&nbsp; 
    Does it match a value in the return list?</p>
    

    <p>
    &nbsp;&nbsp;&nbsp; a. Yes?&nbsp; Do nothing.</p>
    

    <p>
    &nbsp;&nbsp;&nbsp; b. No?&nbsp; We have a new distinct value.&nbsp; Add it 
    to the return list.</p>
    

    <p>
    5.&nbsp;&nbsp;&nbsp; Repeat #4 until we reach the end of the input array.</p>
    

    <p>
    After we've checked the entire input array, there's nothing left to do but 
    ...</p>
    

    <p>
    6.&nbsp;&nbsp;&nbsp; Return the List.</p>
    

    <h4>
    Writing the Code</h4>
    

    <h5>
    Method 1: The Scenic Route</h5>
    

    <p>
    So, after all that consideration, we can start writing the function:</p>
    

    <p class="code">
    private List&lt;String&gt; DistinctList(string ValueList)<br>
    {<br>
    <br>
    }</p>
    

    <p>
    The C# function declaration above defines both the inputs and outputs of the fuction.&nbsp; 
    The List&lt;String&gt; return type means that the function will return a Generic List 
    object that can hold only text strings.&nbsp; The ValueList argument at the 
    end is the delimited string that will be input to the function.&nbsp; This first 
        line is also referred to as the function's <span class="term">signature</span>.&nbsp; 
        A call to this function would look like this:</p>
    <p class="code">
        List&lt;String&gt; resultList = DistinctList(&quot;<font face="Courier New">1234,1234,1234,1235,1234&quot;)</font></p>
    <p>
    Now we need to take care of the first three steps in the algorithm.&nbsp; 
    </p>
    

    <p class="code">
    string[] inputList = ValueList.Split(new char[] {','});<br>
    <br>
    List&lt;String&gt; returnList = new List&lt;String&gt;();<br>
    <br>
    returnList.Add(inputList[0]);</p>
    
    <p>
    I won't go into detail about every keyword used in this code - you can find 
    more information in the help files and elsewhere online - but the first line splits 
    the ValueList argument that was passed into the code into a string array 
    called 'inputList' using the commas as a delimiter.&nbsp; The second line 
    creates an empty List object called 'returnList', setting the required type as a 
        String.&nbsp; The third line copies the first value from inputList to 
    returnList.&nbsp; </p>
    
    <p class=code>
    arrayIndex = 0<br>
    <br>
    foreach (string inputValue in inputList)<br>
    {<br>
&nbsp;&nbsp;&nbsp;&nbsp; match = false;<br>
&nbsp;&nbsp;&nbsp;&nbsp; if (arrayIndex &gt; 0)<br>
&nbsp;&nbsp;&nbsp;&nbsp; {<br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; foreach (String 
    compareValue in returnList)<br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; {<br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; 
    if (!match &amp;&amp; (compareValue == inputValue))<br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; 
    {<br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; 
    match = true;<br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; 
    }<br>
    &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
    }<br>
    &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
    if (!match)<br>
    &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
    {<br>
    &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
    returnList.Add(inputValue);<br>
    &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
    }<br>
    &nbsp;&nbsp;&nbsp;&nbsp;
    }<br>
&nbsp;&nbsp;&nbsp;&nbsp; <br>
&nbsp;&nbsp;&nbsp;&nbsp; arrayIndex++<br>
    }
    </p>
    

    <p>
    The above code is the main part of the function.&nbsp; It uses two nested 
    <a title="More on MSDN" target="_blank" href="http://msdn.microsoft.com/en-us/library/ttw7t8t6(v=vs.80).aspx">
    foreach</a> loops, the first iterating through the input array and matching each 
    value against each of the return list values with the second ForEach loop.&nbsp; 
    (The IF statement on the third line skips over the first item in the input 
    array since it's already been handled.)&nbsp; A boolean variable called 
    'match' is used to record a match between the input array and return list.&nbsp; 
    If there is no match, the value is added to the end of the return list.</p>
    

    <p>
    Despite all the comparisons, this code works extremely fast, instantaneously 
    even when I used it with a space instead of a comma as a delimiter and 
    tested it with a few long paragraphs of text.</p>
    <p>
        Once the code is finished,&nbsp; all that&#39;s left is to return the returnList 
        object as the output of the function.</p>
    

    <h5>
    Method 2: Getting on the Freeway</h5>
    

    <p>
    Now, the code above works very well and it's perfectly acceptable for the 
    job.&nbsp; It's reliable, it's fast and it's easily understood by any 
    programmer with even a basic level of experience.&nbsp; That last point is 
    important because as a professional programmer, you'll spend a lot of time 
    analyzing other people's code whether to support it or to learn from it.&nbsp; 
    There's also a good chance that someone else will one day be reading your 
    code.&nbsp; The clearer it is, the better for everyone involved.</p>
    

    <p>
    Still, as I was writing this article, I kept thinking that with all the 
    power behind C#, there had to be a more advanced way to do this than having 
    the program mimic a human method of manual comparison.&nbsp; Also, as I said 
    earlier, I knew that if I didn't find that better method, it was only a 
    matter of time before someone else wrote to me telling me about it and I'd 
    be kicking myself for not finding it.&nbsp; So I started looking through the 
    documentation again. </p>
    

    <p>
    The second version of the method starts out the same; a delimited string is 
    passed to the function which will be returning a List&lt;String&gt; object.&nbsp; 
    The Split function is once again used to split the string into an array.</p>
    

    <p class="code">
    string[] inputList = ValueList.Split(new char[] {','});</p>
    

    <p>
    The next lines change everthing ...</p>
    

    <p class="code">
    List&lt;string&gt; returnList = inputList.Distinct().ToList();<br>
    return returnList;</p>
    

    <p>
    Done. </p>
    

    <p>
    That's right.&nbsp; With some extra research, we've gone from over 15 lines 
    of code (including the variable declarations I didn't show) down to three, 
    including the return line.&nbsp; The Distinct() function performs a query on 
    the array elements much like the following SQL query:</p>
    

    <p class="code">
    SELECT DISTINCT ItemValue
    FROM Collection</p>
    

    <p>
    The ToList() function then converts the resulting collection back to a List 
    object that can be returned from the function.</p>
    

    <h4>
    Conclusion</h4>
    

    <p>
    So which method is better?&nbsp; Well, that depends ...</p>
    

    <p>
    As I said early on, being a programmer goes beyond knowing a specific 
    language. If you're working in a .NET language like C# or VB.NET and have 
    access to functions like these, that's great.&nbsp; On the other hand, what 
    if you're working in one of the earlier flavors of Visual Basic like 
    <a target="_blank" href="http://www.drewslair.com/desk/vba_intro/index.shtml">VBA</a> or 
    VB 6.0?&nbsp; (Yes, there are companies still using both.)&nbsp; There are 
    also other languages that are just as current but are specialized and have 
    more limited vocabularies. You might also be on a deadline without the time 
    to find that one function that will do everything for you.&nbsp; In those 
    cases, it's necessary to know how to think through an algorithm that will 
    get the job done with the basic functions available from a foundation-level 
    knowledge of whatever language you're working with.&nbsp; The fancy stuff 
    can come later. Even when you do have access to powerful functions like 
    those above, you will eventually find that your programs take on greater 
    levels of complexity and those functions become mere pieces in larger 
    puzzles that you have to solve.</p>
    

    <p>
    Besides, I had more fun taking the scenic route.</p>
    

    <h4>
        Try the Code</h4>
    

    <p>
        You can try the code shown here by entering a list of values separated by commas 
        (i.e. text1,text2,text3) and choosing which of the methods you want to use to 
        compare the values.</p>
    <p>
        <asp:Label ID="Label1" runat="server" Text="Enter list of comparison values:"></asp:Label>

        <asp:TextBox ID="textInput" runat="server" Height="48px" Width="570px" 
            TextMode="MultiLine"></asp:TextBox>
    </p>
    <table class="style1">
        <tr>
            <td class="style2" colspan="2">
                <asp:RadioButtonList ID="radOptions" runat="server" 
                    RepeatDirection="Horizontal">
                    <asp:ListItem Value="Manual" Selected="True">Manual Comparison (Scenic Route)</asp:ListItem>
                    <asp:ListItem Value="Automatic">Distinct() Function (Freeway)</asp:ListItem>
                </asp:RadioButtonList>
            </td>
            <td>
                <asp:Button ID="cmdRun" runat="server" Height="24px" Text="Compare Values" 
                    onclick="cmdRun_Click" />
            </td>
        </tr>
        <tr>
            <td class="style2" colspan="2">
                &nbsp; <strong>Results:</strong>&nbsp;</td>
            <td>
                &nbsp;</td>
        </tr>
        <tr>
            <td class="style2"  align="center">
                <asp:ListBox ID="listResults" runat="server" Width="224px"></asp:ListBox>
            </td>
            <td class="style3"  align="center">
                <asp:Label ID="lblResult" runat="server" Font-Size="Large" 
                    style="text-align: center" ForeColor="White"></asp:Label>
            </td>
            <td align="center">
                &nbsp;</td>
        </tr>
    </table>
    <p>
        &nbsp;</p>
    <p>
        &nbsp;</p>


</asp:Content>
<asp:Content ID="Content3" runat="server" 
    contentplaceholderid="ContentPlaceHolder3">
    <h4>
        Summary:</h4>
    <p>
        Programming is about more than knowing how to write the best code.&nbsp; The 
        ability to analyze real-world problems, design solutions with an understanding 
        of the user&#39;s needs and turn those solutions into code is crucial.</p>
</asp:Content>



