function doAjaxPost(memberId)
{

    $.ajax(
    {
        type: "GET",
        url: "listBooks",
        data: {"memberId": memberId},
        contentType: "application/json; charset=utf-8",
        dataType: "json",
        cache: false,
        beforeSend: function(xhr) {
                        xhr.setRequestHeader("Accept", "application/json");
                        xhr.setRequestHeader("Content-Type", "application/json");
                    },
        success: function(data) {
        			var tableHeaderElement=tableHeaderCreate();
        			var tableBodyElement=tableBodyCreate(data.booksLent);
        			$("#booksLentTable").empty();
        			$("#booksLentTable").append(tableHeaderElement);
        			$("#booksLentTable").append(tableBodyElement);
                 },
        error:function(data,status,er) {
            alert("error: "+data+" status: "+status+" er:"+er);
        }

    });
}


function tableHeaderCreate(data)
{
 var tbl  = document.createElement("thead");
 var tr = tbl.insertRow();
 
 var th1 = document.createElement("th");
 th1.appendChild(document.createTextNode("S.No"));
 tr.appendChild(th1);
 var th2 = document.createElement("th");
 th2.appendChild(document.createTextNode("Title"));
 tr.appendChild(th2);
 var th3 = document.createElement("th");
 th3.appendChild(document.createTextNode("Author"));
 tr.appendChild(th3);
 var th4 = document.createElement("th");
 th4.appendChild(document.createTextNode("ISBN"));
 tr.appendChild(th4);
 
 return tbl;
}

// Function to create a table as a child of el.
//data must be an array of arrays (outer array is rows).
function tableBodyCreate(data)
{
 var tbl  = document.createElement("tbody");
 var j=0;
 for (var i = 0; i < data.length; ++i)
 {
     var tr = tbl.insertRow();
     
     var td1 = tr.insertCell();
     td1.appendChild(document.createTextNode(++j));
     
     var td2 = tr.insertCell();
     td2.appendChild(document.createTextNode(data[i].title));
     var td3 = tr.insertCell();
     td3.appendChild(document.createTextNode(data[i].author));
     var td4 = tr.insertCell();
     td4.appendChild(document.createTextNode(data[i].isbn));
     
 }
 return tbl;
}