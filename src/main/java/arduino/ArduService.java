package arduino;

public interface ArduService {
	void ArduSetIn(ArduDTO dto);
	void ArduSetOut(ArduDTO dto);
	int getSeat(int stopper);
}
