<%@ include file="/WEB-INF/template/include.jsp"%>

<%@ include file="/WEB-INF/template/header.jsp"%>

<div id="smalltable">	
<ul id="menu">
  <h2><strong>New Referral</strong></h2>
</ul>
&nbsp;&nbsp;
  <table width="600" border="1" cellpadding="20">
  <tr>
    <td width="72" height="30">Name</td>
    <td width="164">Emergency type</td>
    <td width="254">  Referral  Date and time</td>
    <td width="82">  Select</td>
  </tr>
  <tr>
    <td>&nbsp;</td>
    <td>&nbsp;</td>
    <td>&nbsp;</td>
    <td>&nbsp;<form id="form1" name="form1" method="post" action="">
      <label>
        <input type="radio" name="radio" id="radio1" value="radio" />
      </label>
    </form></td>
  </tr>
  <tr>
    <td>&nbsp;</td>
    <td>&nbsp;</td>
    <td>&nbsp;</td>
    <td>&nbsp;<form id="form1" name="form1" method="post" action="">
      <label>
        <input type="radio" name="radio" id="radio2" value="radio" />
      </label>
    </form></td>
  </tr>
  <tr>
    <td>&nbsp;</td>
    <td>&nbsp;</td>
    <td>&nbsp;</td>
    <td><form id="form1" name="form1" method="post" action="">
      <label>
        <input type="radio" name="radio" id="radio3" value="radio" />
      </label>
    </form></td>
  </tr>
  <tr>
    <td>&nbsp;</td>
    <td>&nbsp;</td>
    <td>&nbsp;</td>
    <td><form id="form1" name="form1" method="post" action="">
      <label>
        <input type="radio" name="radio" id="radio4" value="radio" />
      </label>
    </form>
  </tr>
  <tr>
    <td>&nbsp;</td>
    <td>&nbsp;</td>
    <td>&nbsp;</td>
    <td><form id="form1" name="form1" method="post" action="">
      <label>
        <input type="radio" name="radio" id="radio5" value="radio" />
      </label>
    </form></td>
  </tr>
  </table>
  <p><div>
    <input name="submit" type="submit" value="Submit" />
		 <input type="reset" name="Reset" id="button" value="Reset" />
  </div> 
         
  </p>
  <div id="next" align="center"><input name="Next" type="button" value="Next" /></div>
        		
</div>

<p>abc </p>
<p>&nbsp;</p>
<%@ include file="/WEB-INF/template/footer.jsp"%>