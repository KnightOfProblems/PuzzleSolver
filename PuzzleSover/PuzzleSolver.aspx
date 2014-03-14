<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="PuzzleSolver.aspx.cs" Inherits="PuzzleSover.PuzzleSolver" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
    <style>
        body {
           background:blue;
        }

        .circle-container {
            position: relative;
            z-index: 10;
            width: 600px;
            height: 600px;
            margin-left: auto;
            margin-right: auto;
        }

        .circularHolder {
            overflow: hidden;
            position: absolute;
            /*top: 300px; left: 250px;*/
            width: 100px;
            height: 100px;
            border-radius: 50%;
        }

        .rankHolder {
            position: relative;
            width: 100px;
            height: 30px;
            text-align: center;
            line-height: 30px;
            border-radius: 5%;
            color: white;
            background-color: #000;
            -webkit-border-radius: 5%;
            -moz-border-radius: 5%;
            border-radius: 5%;
            z-index: 1000;
        }

        .triangle {
            content: "";
            position: absolute;
            top: 95%;
            left: 40%;
            border-top-width: 6px;
            border-top-style: solid;
            border-top-color: black;
            border-left: 10px solid transparent;
            border-right: 10px solid transparent;
        }

    </style>
</head>
<body>
    <form id="form1" runat="server">
        <div style="position:absolute;z-index:10000;width: 100%;
text-align: center;"><a class="star-tweet" href="https://twitter.com/timoreilly/status/444138621386244096" target="_blank" style="color:white;font:800;z-index:100;">Brilliant @fredtrotter post about bitcoin, Wall Street, and cancer http://t.co/q9WZNA0cZR) Must read on "malignant computation"!</a></div>
        <div class='circle-container'>
            <div style="position: absolute; width: 300px; height: 300px; margin-left: auto; left: 150px; top: 200px;">
                <img src="<%=authorUrl%>" style="border-radius: 50%; width: 300px; height: 300px;" />
            </div>

            <% float angle = 360 / tweetsUserName.Count;
               for (int i = 0; i < tweetsUserName.Count; i++)
               {
                   string imgurl = tweetsUserName[i].profileImage;
                   if (imgurl.Contains(".png") || imgurl.Contains(".jpg") || imgurl.Contains(".bmp"))
                   {
                       imgurl = imgurl.Remove(imgurl.Length - 11, 7);
                   }
                   else if (imgurl.Contains(".jpeg"))
                   {
                       imgurl = imgurl.Remove(imgurl.Length - 12, 7);
                   }
                   double top = 215 * (Math.Sin(angle * (i)));
                   double left = 215 * (Math.Cos(angle * (i)));
                   double posTop = left < 0 ? (250 + left) : (250 + left);
                   double posLeft = top < 0 ? (300 + top) : (300 + top);
            %>
            <div id="rankHolder<%=i %>" class="rankHolder" style="visibility: hidden; position: absolute; top: 260px; left: 250px; transform: rotate(<%=(360 / tweetsUserName.Count * i)+270 %>deg) translate(215px) rotate(<%=( -360 / tweetsUserName.Count * i)-270 %>deg);
 -webkit-transform: rotate(<%=(360 / tweetsUserName.Count * i)+270 %>deg) translate(215px) rotate(<%=( -360 / tweetsUserName.Count * i)-270 %>deg); -ms-transform: rotate(<%=(360 / tweetsUserName.Count * i)+270 %>deg) translate(215px) rotate(<%=( -360 / tweetsUserName.Count * i)-270 %>deg);">
                <%=i+1 %><div class="triangle"></div>
            </div>
            <div onmouseover="dispayRank(<%=i %>)" onmouseout="hideRank(<%=i %>)" style="position: absolute; top: 300px; left: 250px; transform: rotate(<%=(360 / tweetsUserName.Count * i)+270 %>deg) translate(215px) rotate(<%=( -360 / tweetsUserName.Count * i)-270 %>deg); -webkit-transform: rotate(<%=(360 / tweetsUserName.Count * i)+270 %>deg) translate(215px) rotate(<%=( -360 / tweetsUserName.Count * i)-270 %>deg);
 -ms-transform: rotate(<%=(360 / tweetsUserName.Count * i)+270 %>deg) translate(215px) rotate(<%=( -360 / tweetsUserName.Count * i)-270 %>deg); position: absolute;">
                <a href='#' class="circularHolder" id="image<%=i %>">
                    <img src='<%=imgurl%>' style="width: 100px; height: 100px;">
                </a>
            </div>
            <%} %>
        </div>
        <script type="text/javascript">
            function dispayRank(id) {
                var eleId = "rankHolder" + id;

                document.getElementById(eleId).style.visibility = "visible";
            }
            function hideRank(id) {
                var eleId = "rankHolder" + id;

                document.getElementById(eleId).style.visibility = "hidden";
            }
        </script>

        <asp:Panel ID="Panel1" runat="server"></asp:Panel>
    </form>
</body>
</html>
