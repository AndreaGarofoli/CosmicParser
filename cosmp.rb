<<<<<<< HEAD
# Parsa un file .vcf e genera un file di testo con: cromosoma, posizione e 
# il rapporto del n° di riscontri di mutazioni di questo tipo su tutte
# le mutazioni studiate
=======
# Parsa un file .vcf e genera un file di testo con: cromosoma, posizione e
# il rapporto del n° di riscontri di mutazioni di questo tipo su tutte le
# mutazioni studiate


  class VCFp
    attr_reader :m
    attr_writer :m
    
    def rimc(i)
      c=0
      m=open(i).readlines.map{ |i| i.chomp.to_s}
      m.size.times{ |x|
        if m[x][0]=="#" then m[x]=NIL
        else
          m[x]=m[x].split("\t")
          c=c+m[x][7].partition('CNT=').last.to_i
        end
      }
      
      m=m.compact
      m.delete_if {|x| x == nil}  
>>>>>>> c38abf0c6a1493954e3b14fd59b63684a88e5f9b

      m.size.times{ |x|
          m[x][2]=m[x][5]=m[x][6]=m[x][3]=m[x][4]=""         
          m[x][7]="#{m[x][7].partition('CNT=').last.to_i}/#{c}"
          m[x]=m[x].join("\t")
      }

      File.open("out.txt", "w") {|f| f.write(m.join("\n"))}

    end

  end
a=VCFp.new
a.rimc("cosm.vcf")
