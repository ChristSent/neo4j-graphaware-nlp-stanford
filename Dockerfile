FROM neo4j:3.5.14
RUN wget -O plugins/graphaware-server-all.jar https://neo4j-plugins-public.s3.eu-west-1.amazonaws.com/graphaware-server-all-3.5.14.55.jar
RUN wget -O plugins/graphaware-nlp.jar https://neo4j-plugins-public.s3.eu-west-1.amazonaws.com/nlp-3.5.4.53.18.jar
RUN wget -O plugins/graphaware-nlp-stanfordnlp.jar https://neo4j-plugins-public.s3.eu-west-1.amazonaws.com/nlp-stanfordnlp-3.5.4.53.18.jar
RUN wget -O plugins/stanford-english-core-nlp.jar http://nlp.stanford.edu/software/stanford-english-corenlp-2018-10-05-models.jar
RUN wget -O plugins/apoc-3.5.0.12-all.jar https://github.com/neo4j-contrib/neo4j-apoc-procedures/releases/download/3.5.0.12/apoc-3.5.0.12-all.jar
RUN echo "dbms.unmanaged_extension_classes=com.graphaware.server=/graphaware\ncom.graphaware.runtime.enabled=true\ncom.graphaware.module.NLP.1=com.graphaware.nlp.module.NLPBootstrapper\ndbms.security.procedures.whitelist=ga.nlp.*" >> conf/neo4j.conf
EXPOSE 7474 7473 7687
ENV NEO4J_AUTH=none
CMD ["neo4j"]
