package dashboard;

import java.math.BigDecimal;
import java.sql.Timestamp;

/**
 * @author 김희은 (khe930@kr.ibm.com)
 *
 */
public class Dataset {

	public BigDecimal mite;
	
	public String LogSeq;
	
	public String LogDate;
	
	public String UserCd;
	
	public String ConvData;  
	
	public String WatsonPassYn;  
	
	public String WatsonRetrainYn;  
	
	public Timestamp RegDate;
	
	public BigDecimal cnt;	

	public BigDecimal getCnt() {
		return cnt;
	}

	public void setCnt(BigDecimal cnt) {
		this.cnt = cnt;
	}

	public BigDecimal getMite() {
		return mite;
	}

	public void setMite(BigDecimal mite) {
		this.mite = mite;
	}

	public String getLogSeq() {
		return LogSeq;
	}

	public void setLogSeq(String logSeq) {
		LogSeq = logSeq;
	}

	public String getLogDate() {
		return LogDate;
	}

	public void setLogDate(String logDate) {
		LogDate = logDate;
	}

	public String getUserCd() {
		return UserCd;
	}

	public void setUserCd(String userCd) {
		UserCd = userCd;
	}

	public String getConvData() {
		return ConvData;
	}

	public void setConvData(String convData) {
		ConvData = convData;
	}

	public String getWatsonPassYn() {
		return WatsonPassYn;
	}

	public void setWatsonPassYn(String watsonPassYn) {
		WatsonPassYn = watsonPassYn;
	}

	public String getWatsonRetrainYn() {
		return WatsonRetrainYn;
	}

	public void setWatsonRetrainYn(String watsonRetrainYn) {
		WatsonRetrainYn = watsonRetrainYn;
	}

	public Timestamp getRegDate() {
		return RegDate;
	}

	public void setRegDate(Timestamp regDate) {
		RegDate = regDate;
	}  
	
}
