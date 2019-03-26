import java.util.Iterator;
import java.util.LinkedHashMap;
import java.util.Map;
import java.util.regex.Matcher;
import java.util.regex.Pattern;

public class TextProcessor {
	/*
	 * 所在行数
	 */
	private static int row = 1;
	/*
	 * 开始截取空格
	 */
	private static int start;
	/*
	 * 结束截取空格
	 */
	private static int end;
	/*
	 * 单词的角标
	 */
	private static int j = 0;
	/*
	 * 存储截取的单词数组
	 */
	private static String[] words;
	/*
	 * 宽度
	 */
	private static int width = 22;

	public static void main(String[] args) throws Exception {
		/*
		 * 定义字符串
		 */
		String text = "The    man theme of education in    engineering school is    learning to teach yourself !";
		/*
		 * 调用函数并存储在map
		 */
		Map<String, String> map = process(text, width);

		/*
		 * 遍历map
		 */
		for (Iterator<String> i = map.keySet().iterator(); i.hasNext();) {
			Object obj = i.next();
			if (j < words.length - 1 && text.indexOf(words[j]) + 1 >= width * row
					&& width * row <= text.indexOf(words[j + 1]) + 1) {
				System.out.println("");
				row++;
				j++;
				System.out.print(obj + "(" + row + ");" + map.get(obj) + "(" + row + ");");
			} else if (j < words.length - 1 && text.indexOf(words[j]) + words[j].length() < width * row
					&& width * row <= text.indexOf(words[j + 1]) + 1) {
				// System.out.println("");
				row++;
				j++;
				System.out.println(obj + "(" + (row - 1) + ");");
				System.out.print(map.get(obj) + "(" + row + ");");
			} else if (j < words.length - 1 && text.indexOf(words[j]) + 1 <= width * row
					&& text.indexOf(words[j]) + words[j].length() >= width * row) {
				row++;
				j++;
				System.out.println(obj + "(" + (row - 1) + "," + row + ");");
				System.out.print(map.get(obj) + "(" + row + ");");
			} else {
				System.out.print(obj + "(" + row + ");" + map.get(obj) + "(" + row + ");");
				j++;
			}

		}
	}

	@SuppressWarnings("null")
	static Map<String, String> process(String text, int width) throws Exception {
		/*
		 * 特殊字符检测
		 */
		Pattern p = Pattern
				.compile("[\u4e00-\u9fa5`~@#$%^&*()+=|{}':;',\\\\[\\\\].<>/?~！@#￥%……&*（）——+|{}【】‘；：”“’。，、？]");
		Matcher m = p.matcher(text);

		if (m.find()) {
			throw new Exception("ERROR: Invalid character detected!");
		}

		/*
		 * 宽度检测
		 */
		if (width < 10 || width > 80)
			throw new Exception("ERROR: Width out of range!");
		text = text.trim();
		int len = text.length();
		if (len == 0)
			return null;
		Map<String, String> map = new LinkedHashMap<String, String>();
		/*
		 * 在空格出截取单词
		 */
		words = text.split("\\s+");
		String whitespaces = null;
		for (int i = 0; i < words.length; i++) {
			if (i < words.length - 1) {
				/*
				 * 截取空格
				 */
				start = text.indexOf(words[i]) + words[i].length();
				end = text.indexOf(words[i + 1]);
				whitespaces = text.substring(start, end);
			}

			/*
			 * 把截取到的单词和空格以键值对形式存储
			 */
			if (!map.containsKey(words[i])) {
				map.put(words[i], whitespaces);
			} else {
				map.put(words[i], whitespaces);
			}
		}
		/*
		 * 返回map
		 */
		return map;
	}
}
