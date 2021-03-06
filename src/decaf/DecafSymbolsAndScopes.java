package decaf;
import org.antlr.symtab.FunctionSymbol;
import org.antlr.symtab.GlobalScope;
import org.antlr.symtab.LocalScope;
import org.antlr.symtab.Scope;
import org.antlr.symtab.VariableSymbol;
import org.antlr.symtab.Symbol;
import org.antlr.v4.runtime.misc.NotNull;
import org.antlr.v4.runtime.ParserRuleContext;
import org.antlr.v4.runtime.Token;
import org.antlr.v4.runtime.tree.ParseTreeProperty;


/**
 * This class defines basic symbols and scopes for Decaf language
 */
public class DecafSymbolsAndScopes extends DecafParserBaseListener {
    ParseTreeProperty<Scope> scopes = new ParseTreeProperty<Scope>();
    GlobalScope globals;
    Scope currentScope; // define symbols in this scope

    @Override
    public void enterProgram(DecafParser.ProgramContext ctx) {
        globals = new GlobalScope(null);
        pushScope(globals);
    }

    @Override
    public void exitProgram(DecafParser.ProgramContext ctx) {
        System.out.println(globals);
    }

    @Override
    public void enterMethod_decl(DecafParser.Method_declContext ctx) {
        String name = ctx.ID().get(0).getText();
        //int typeTokenType = ctx.type().get(0).start.getType();
        //DecafSymbol.Type type = this.getType(typeTokenType);

        // push new scope by making new one that points to enclosing scope
        FunctionSymbol function = new FunctionSymbol(name);
        // function.setType(type); // Set symbol type

        currentScope.define(function); // Define function in current scope
        saveScope(ctx, function);
        pushScope(function);
    }

    @Override
    public void exitMethod_decl(DecafParser.Method_declContext ctx) {
        //popScope();
    }

    @Override
    public void enterBlock(DecafParser.BlockContext ctx) {
        LocalScope l = new LocalScope(currentScope);
        saveScope(ctx, currentScope);
        //pushScope(l);
    }

    @Override
    public void exitBlock(DecafParser.BlockContext ctx) {
        //popScope();
    }

    @Override
    public void enterField_decl(DecafParser.Field_declContext ctx) {
        enterVar_decl(ctx.type().get(0), ctx.ID().get(0).getSymbol());
    }

    @Override
    public void exitField_decl(DecafParser.Field_declContext ctx) {
        String name = ctx.ID().get(0).getSymbol().getText();
        Symbol var = currentScope.resolve(name);
        if ( var==null ) {
            this.error(ctx.ID().get(0).getSymbol(), "no such variable: "+name);
        }
        if ( var instanceof FunctionSymbol ) {
            this.error(ctx.ID().get(0).getSymbol(), name+" is not a variable");
        }
    }

    void enterVar_decl(DecafParser.TypeContext typeCtx, Token nameToken) {
        int typeTokenType = typeCtx.start.getType();
        VariableSymbol var = new VariableSymbol(nameToken.getText());

        // DecafSymbol.Type type = this.getType(typeTokenType);
        // var.setType(type);

        currentScope.define(var); // Define symbol in current scope
    }

	@Override 
	public void exitVar_decl(DecafParser.Var_declContext ctx) {

	 }
	@Override 
	public void enterType(DecafParser.TypeContext ctx) { 

	}
	@Override 
	public void exitType(DecafParser.TypeContext ctx) { 

	}
	@Override 
	public void enterStatement(DecafParser.StatementContext ctx) { 

	}

	@Override 
	public void exitStatement(DecafParser.StatementContext ctx) { 

	}
	@Override 
	public void enterAssign_op(DecafParser.Assign_opContext ctx) { 

	}
	@Override 
	public void exitAssign_op(DecafParser.Assign_opContext ctx) { 

	}
	@Override 
	public void enterMethod_call(DecafParser.Method_callContext ctx) { 

	}
	@Override 
	public void exitMethod_call(DecafParser.Method_callContext ctx) { 

	}
	@Override 
	public void enterLocation(DecafParser.LocationContext ctx) { 
	
	}
	@Override 
	public void exitLocation(DecafParser.LocationContext ctx) { 
	
	}
	@Override 
	public void enterExpr(DecafParser.ExprContext ctx) { 
	}
	/**
	 * {@inheritDoc}
	 *
	 * <p>The default implementation does nothing.</p>
	 */
	@Override public void exitExpr(DecafParser.ExprContext ctx) { 
	}





    /**
     * Método que atuliza o escopo para o atual e imprime o valor
     *
     * @param s
     */
    private void pushScope(Scope s) {
        currentScope = s;
        System.out.println("entering: "+currentScope.getName()+":"+s);
    }

    /**
     * Método que cria um novo escopo no contexto fornecido
     *
     * @param ctx
     * @param s
     */
    void saveScope(ParserRuleContext ctx, Scope s) {
        scopes.put(ctx, s);
    }

    /**
     * Muda para o contexto superior e atualia o escopo
     */
    private void popScope() {
        System.out.println("leaving: "+currentScope.getName()+":"+currentScope);
        currentScope = currentScope.getEnclosingScope();
    }

    public static void error(Token t, String msg) {
        System.err.printf("line %d:%d %s\n", t.getLine(), t.getCharPositionInLine(),
                msg);
    }

    /**
     * Valida tipos encontrados na linguagem para tipos reais
     *
     * @param tokenType
     * @return
     */
    public static DecafSymbol.Type getType(int tokenType) {
        switch ( tokenType ) {
            case DecafParser.VOID :  return DecafSymbol.Type.tVOID;
            case DecafParser.INT :   return DecafSymbol.Type.tINT;
        }
        return DecafSymbol.Type.tINVALID;
    }


}
