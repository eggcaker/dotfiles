#!/usr/bin/env kscript
@file:DependsOn("de.mpicbg.scicomp:kutils:0.4")

import de.mpicbg.scicomp.bioinfo.openFasta

if (args.size != 1) {
  System.err.println("Usage: CountRecords <fasta>")
  kotlin.system.exitProcess(-1)
}

val records = openFasta(java.io.File(args[0]))
println(records.count())
