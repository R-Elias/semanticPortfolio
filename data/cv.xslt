<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
    <!-- Déclare le paramètre lang avec une valeur par défaut "fr" -->
    <xsl:param name="lang" select="'fr'"/>
    
    <!-- Template de match principal -->
    <xsl:template match="/resumes">
        <!-- Sélectionne le CV selon la langue passée en paramètre -->
        <xsl:variable name="resume" select="resume[@lang=$lang]"/>
        <html>
            <body>
                <h1>
                    <xsl:choose>
                        <xsl:when test="$lang = 'fr'">Curriculum Vitae</xsl:when>
                        <xsl:when test="$lang = 'en'">Resume</xsl:when>
                        <xsl:otherwise>履歷表</xsl:otherwise>
                    </xsl:choose>
                </h1>
                <div typeof="Person" about="#person">
                    <h2>
                        <xsl:choose>
                            <xsl:when test="$lang = 'fr'">Informations personnelles</xsl:when>
                            <xsl:when test="$lang = 'en'">Personal Information</xsl:when>
                            <xsl:otherwise>个人信息</xsl:otherwise>
                        </xsl:choose>
                    </h2>
                    <p>
                        <xsl:choose>
                            <xsl:when test="$lang = 'fr'">Nom</xsl:when>
                            <xsl:when test="$lang = 'en'">Name</xsl:when>
                            <xsl:otherwise>名字</xsl:otherwise>
                        </xsl:choose>: 
                        <span property="name"><xsl:value-of select="$resume/personal/name"/></span>
                    </p>
                    <p>
                        <xsl:choose>
                            <xsl:when test="$lang = 'fr'">Courriel</xsl:when>
                            <xsl:when test="$lang = 'en'">Email</xsl:when>
                            <xsl:otherwise>电子邮件</xsl:otherwise>
                        </xsl:choose>: 
                        <span property="schema:email"><xsl:value-of select="$resume/personal/email"/></span>
                    </p>
                    <p>
                        <xsl:choose>
                            <xsl:when test="$lang = 'fr'">Téléphone</xsl:when>
                            <xsl:when test="$lang = 'en'">Phone</xsl:when>
                            <xsl:otherwise>电话</xsl:otherwise>
                        </xsl:choose>: 
                        <span property="telephone"><xsl:value-of select="$resume/personal/phone"/></span>
                    </p>
                    <p>
                        <xsl:choose>
                            <xsl:when test="$lang = 'fr'">Adresse</xsl:when>
                            <xsl:when test="$lang = 'en'">Address</xsl:when>
                            <xsl:otherwise>地址</xsl:otherwise>
                        </xsl:choose>: 
                        <span property="address"><xsl:value-of select="$resume/personal/address"/></span>
                    </p>
                </div>

                <div>
                    <h2>
                        <xsl:choose>
                            <xsl:when test="$lang = 'fr'">Expérience professionnelle</xsl:when>
                            <xsl:when test="$lang = 'en'">Professional Experience</xsl:when>
                            <xsl:otherwise>工作经验</xsl:otherwise>
                        </xsl:choose>
                    </h2>
                    <xsl:for-each select="$resume/experience/job">
                        <div typeof="JobPosting" about="#job{position()}">
                            <h3 property="title"><xsl:value-of select="title"/></h3>
                            <p>
                                <xsl:choose>
                                    <xsl:when test="$lang = 'fr'">Entreprise</xsl:when>
                                    <xsl:when test="$lang = 'en'">Company</xsl:when>
                                    <xsl:otherwise>公司</xsl:otherwise>
                                </xsl:choose>: 
                                <span property="hiringOrganization"><xsl:value-of select="company"/></span>
                            </p>
                            <p>
                                <xsl:choose>
                                    <xsl:when test="$lang = 'fr'">Années</xsl:when>
                                    <xsl:when test="$lang = 'en'">Years</xsl:when>
                                    <xsl:otherwise>年</xsl:otherwise>
                                </xsl:choose>: 
                                <span property="datePosted"><xsl:value-of select="years"/></span>
                            </p>
                            <p>
                                <xsl:choose>
                                    <xsl:when test="$lang = 'fr'">Description</xsl:when>
                                    <xsl:when test="$lang = 'en'">Description</xsl:when>
                                    <xsl:otherwise>描述</xsl:otherwise>
                                </xsl:choose>: 
                                <span property="description"><xsl:value-of select="description"/></span>
                            </p>
                        </div>
                    </xsl:for-each>
                </div>

                <div>
                    <h2>
                        <xsl:choose>
                            <xsl:when test="$lang = 'fr'">Éducation</xsl:when>
                            <xsl:when test="$lang = 'en'">Education</xsl:when>
                            <xsl:otherwise>教育</xsl:otherwise>
                        </xsl:choose>
                    </h2>
                    <xsl:for-each select="$resume/education/degree">
                        <div typeof="EducationalOccupationalCredential" about="#degree{position()}">
                            <h3 property="credentialCategory"><xsl:value-of select="title"/></h3>
                            <p>
                                <xsl:choose>
                                    <xsl:when test="$lang = 'fr'">Institution</xsl:when>
                                    <xsl:when test="$lang = 'en'">Institution</xsl:when>
                                    <xsl:otherwise>机构</xsl:otherwise>
                                </xsl:choose>: 
                                <span property="educationalLevel"><xsl:value-of select="institution"/></span>
                            </p>
                            <p>
                                <xsl:choose>
                                    <xsl:when test="$lang = 'fr'">Années</xsl:when>
                                    <xsl:when test="$lang = 'en'">Years</xsl:when>
                                    <xsl:otherwise>年</xsl:otherwise>
                                </xsl:choose>: 
                                <span property="dateReceived"><xsl:value-of select="years"/></span>
                            </p>
                        </div>
                    </xsl:for-each>
                </div>

                <div>
                    <h2>
                        <xsl:choose>
                            <xsl:when test="$lang = 'fr'">Compétences</xsl:when>
                            <xsl:when test="$lang = 'en'">Skills</xsl:when>
                            <xsl:otherwise>技能</xsl:otherwise>
                        </xsl:choose>
                    </h2>
                    <ul>
                        <xsl:for-each select="$resume/skills/skill">
                            <li property="skills" about="#skill{position()}"><xsl:value-of select="."/></li>
                        </xsl:for-each>
                    </ul>
                </div>

                <div>
                    <h2>
                        <xsl:choose>
                            <xsl:when test="$lang = 'fr'">Vidéo bonus</xsl:when>
                            <xsl:when test="$lang = 'en'">Bonus Video</xsl:when>
                            <xsl:otherwise>额外视频</xsl:otherwise>
                        </xsl:choose>
                    </h2>
                    <div style="text-align: center;">
                        <video width="600" controls="controls">
                            <xsl:choose>
                                <xsl:when test="$lang = 'fr'">
                                    <xsl:element name="source">
                                        <xsl:attribute name="src">../static/vid/Bing_Chilling_fr.mp4</xsl:attribute>
                                        <xsl:attribute name="type">video/mp4</xsl:attribute>
                                    </xsl:element>
                                    Votre navigateur ne supporte pas la vidéo.
                                </xsl:when>
                                <xsl:when test="$lang = 'en'">
                                    <xsl:element name="source">
                                        <xsl:attribute name="src">../static/vid/Bing_Chilling_en.mp4</xsl:attribute>
                                        <xsl:attribute name="type">video/mp4</xsl:attribute>
                                    </xsl:element>
                                    Your browser does not support the video.
                                </xsl:when>
                                <xsl:otherwise>
                                    <xsl:element name="source">
                                        <xsl:attribute name="src">../static/vid/Bing_Chilling_zh.mp4</xsl:attribute>
                                        <xsl:attribute name="type">video/mp4</xsl:attribute>
                                    </xsl:element>
                                    您的浏览器不支持视频。
                                </xsl:otherwise>
                            </xsl:choose>
                        </video>
                    </div>
                </div>



                
                <div style="width: 100%; background-color: #f1f1f1; padding: 10px 0; position: fixed; bottom: 0; left: 0; text-align: center; border-top: 1px solid #ccc;" typeof="CreativeWork">
                    <p style="margin: 0;" property="copyrightHolder" typeof="Person">
                        <xsl:choose>
                            <xsl:when test="$lang = 'fr'">© <span property="name">Elias Aliche</span>. Tous droits réservés.</xsl:when>
                            <xsl:when test="$lang = 'en'">© <span property="name">Elias Aliche</span>. All rights reserved.</xsl:when>
                            <xsl:otherwise>© <span property="name">Elias Aliche</span>. 版权所有。</xsl:otherwise>
                        </xsl:choose>
                    </p>
                </div>
            </body>
        </html>
    </xsl:template>
</xsl:stylesheet>
