package flyingMember;
import java.util.Arrays;

public class ReservationCompare {

	public static String SeatCompare(int[] arr, int a) {
		String dis = "disabled";
		String ena = "enabled";

		for(int i=0; i<arr.length; i++) {
			if(arr[i] == a) {
				return dis;
			}
			
		}
		return ena;
	}
	
	public static String LockerCompare(int[] arr, int a) {
		String dis = "disabled";
		String ena = "enabled";

		for(int i=0; i<arr.length; i++) {
			if(arr[i] == a) {
				return dis;
			}
			
		}
		return ena;
	}
}
