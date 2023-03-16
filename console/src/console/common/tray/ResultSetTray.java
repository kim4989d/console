package console.common.tray;

public class ResultSetTray extends AbstractTray {
    private String[] columnNames     = null;
    private String[] columnTypeNames = null;
    private int      rowCount        = 0;

    
    public String toString() {
        StringBuffer buffer   = null;
        int col_count = 0;
        int row_max   = 0;
        int rows[]    = null;
        
        buffer = new StringBuffer();
        col_count = columnNames == null ? 0 : columnNames.length;

        if (rowCount == 0) {
        	buffer.append("조회된 내용이 없습니다.\n");
            for (int i = 0; i < col_count; i++) {
            	buffer.append('['+ fillString(columnNames[i], 20)).append("]\n");
            }
        } else {
            buffer.append("------ 총조회건수 : ").append(getRowCount()).append('\n');

            rows = new int[col_count];
            for (int i = 0; i < col_count; i++) {
                rows[i] = size(columnNames[i]);
            	row_max = Math.max(row_max, rows[i]);
            }

            for (int i = 0; i < row_max; i++) {
            	buffer.append("[ROW : " + i).append(" ]\n");
                for (int j = 0; j < col_count; j++) {
                	buffer.append('['+ fillString(columnNames[j], 20)).append("]\t");
                	buffer.append(i > rows[j]? "{null}" : getString(columnNames[j], i)).append("\n");
                }
            }
        }
        return buffer.toString();
    }
    
    public void setColumnNames(String[] columnNamesObj) {
        columnNames = columnNamesObj;
    }

    public void setColumnTypeNames(String[] columnTypeNamesObj) {
        columnTypeNames = columnTypeNamesObj;
    }

    public String[] getColumnNames() {
        return columnNames;
    }

    public String[] getColumnTypeNames() {
        return columnTypeNames;
    }
    
    public int getRowCount() {
    	return rowCount;
    }
    
    protected void setRowCount(int rows) {
    	rowCount = rows;
    }
}
