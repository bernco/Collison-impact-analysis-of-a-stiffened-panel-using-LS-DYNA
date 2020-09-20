$# LS-DYNA Keyword file created by LS-PrePost(R) V4.3.12 - 10Jul2017
$# Created on Mar-10-2020 (16:23:13)
*KEYWORD
$
$===============================================================================
$ Simulation Mesh size 20 mm 
$ Impact sperical indenter
$ Initial impact velocity : ? m/s 
$ Friction coefficient µ=0.3
$ mild steel 
$ Yield stress : 240 MPa
$ Poisson coefficient : 0.33
$ Young modulus : 210 000 MPa
$ tangent mudulus : 1018 MPa
$ Density : 7850 kg/m^3
$ Element size = 20 mm
$ Element edge length le = sqrt(2) * 20 :-[since the element is a square]
$ Thickness = 7.9 mm
$ Failure strain = 0.056 +0.54*th/le = 0.207
$===============================================================================
$
$===============================================================================
$ Control cards
$===============================================================================
$
*CONTROL_CONTACT
$  SLSFAC|   RWPNAL|   ISLCHK|   SHLTHK|   PENOPT|   THKCHG|    ORIEN|   ENMASS|
$#  slsfac    rwpnal    islchk    shlthk    penopt    thkchg     orien    enmass
       0.0       0.0         2         0         0         0         0         0
$  USRSTR|   USRFRC|    NSBCS|   INTERM|    XPENE|    SSTHK|     ECDT|  TIEDPRJ|
$#  usrstr    usrfrc     nsbcs    interm     xpene     ssthk      ecdt   tiedprj
         0         0         0         0       0.0         0         0         0
$#   sfric     dfric       edc       vfc        th     th_sf    pen_sf      
       0.0       0.0       0.0       0.0       0.0       0.0       0.0
$#  ignore    frceng   skiprwg    outseg   spotstp   spotdel   spothin       
         0         0         0         0         0         0       0.0
$#    isym    nserod    rwgaps    rwgdth     rwksf      icov    swradf    ithoff
         0         0         1       0.0       1.0         0       0.0         0
$#  shledg    pstiff    ithcnt    tdcnof     ftall    unused    shltrw      
         0         0         0         0         0                 0.0
$
*CONTROL_ENERGY
$    HGEN|     RWEN|   SLNTEN|    RYLEN|
$#    hgen      rwen    slnten     rylen     
         2         2         2         1
$
*CONTROL_HOURGLASS
$     IHQ|       QH|
$#     ihq        qh  
         4       0.1
$
*CONTROL_OUTPUT
$   NPOPT|   NEECHO|   NREFUP|   IACCOP|    OPIFS|   IPNINT|   IKEDIT|   IFLUSH|
$#   npopt    neecho    nrefup    iaccop     opifs    ipnint    ikedit    iflush
         0         0         0         0       0.0         0       100      5000
$   IPRTF|
$#   iprtf    ierode   tet10s8    msgmax    ipcurv      gmdt   ip1dblt      eocs
         0         0         2        50         0       0.0         0         0
$#   tolev    newleg    frfreq     minfo    solsig    msgflg    cdetol      
         2         0         1         0         0         0      10.0
$# phschng    demden      
         0         0
$
$===============================================================================
$ Here an element is deleted if it moves alone in the air
$==============================================================================
$
*CONTROL_SHELL
$#  wrpang     esort     irnxx    istupd    theory       bwc     miter      proj
      20.0         0        -1         0         2         2         1         0
$# rotascl    intgrd    lamsht    cstyp6    tshell      
       1.0         0         0         1         0
$# psstupd   sidt4tu     cntco    itsflg    irquad    w-mode   stretch      icrq
         0         0         0         0         2       0.0       0.0         0
$#  nfail1    nfail4   psnfail    keepcs     delfr   drcpsid    drcprm      
         1         0         0         0         0         0       1.0
$===============================================================================
$ Here I have decreased the termination time to 0.07 sec because I noticed 
$ that with a initial kinetic energy of 88.3 kJ, the impact lasts much less
$==============================================================================
$
*CONTROL_TERMINATION
$#  endtim    endcyc     dtmin    endeng    endmas      
      0.07         0       0.0      0.01       0.0
$
$===============================================================================
$ Time step is not allowed to decrease under 2 microseconds
$===============================================================================
$
*CONTROL_TIMESTEP
$#  dtinit    tssfac      isdo    tslimt     dt2ms      lctm     erode     ms1st
       0.0       0.9         02.00000E-6       0.0         0         0         0
$#  dt2msf   dt2mslc     imscl    unused    unused     rmscl     
       0.0         0         0                           0.0
$
$===============================================================================
$ ASCII Result files printing cards
$ 1000 plots for each file
$===============================================================================
$
*DATABASE_GCEOUT
$#      dt    binary      lcur     ioopt     
7.00000E-5         0         0         1
*DATABASE_GLSTAT
$#      dt    binary      lcur     ioopt     
7.00000E-5         0         0         1
*DATABASE_MATSUM
$#      dt    binary      lcur     ioopt     
7.00000E-5         0         0         1
*DATABASE_RCFORC
$#      dt    binary      lcur     ioopt     
7.00000E-5         0         0         1
*DATABASE_RBDOUT
$#      dt    binary      lcur     ioopt     
7.00000E-5         0         0         1
*DATABASE_SLEOUT
$#      dt    binary      lcur     ioopt     
7.00000E-5         0         0         1	   
$
$===============================================================================
$ Binary result file printing card
$ 100 plots
$===============================================================================
$
*DATABASE_BINARY_D3PLOT
$#      dt      lcdt      beam     npltc    psetid      
     7.E-4          0         0         0         0
$#   ioopt     
         0
$
$===============================================================================
$ The prescribed motion card has been replaced by a *INITIAL_VELOCITY card  
$ in order to presecribe an initial velocity (at the moment of the impact) to
$ the nodes of the indenter (NODE_SET_LIST number 2) 
$
$ As both the grillage and the identer are moving, the TOTAL energy at the moment of
$ impact is equal to 88,3 kJ (see Bruce's document). The impacting and impacted structures
$ have the same mass and velocity at the moment of impact. As a consequence, if the grillage
$ is assumed fixed (it is clamped in your simulation), the indeter kinetic energy have to be
$ doubled. To do that:
$ - the mass of the identer can be doubled : 4500 x 2 = 9000 kg
$ - the indenter horizontal velocity is taken egal to 4.429 m/s (see Bruce's document) for 
$   an initial pendulum angle of 60°.
$ 
$===============================================================================
$
*INITIAL_VELOCITY
$#    nsid
         2
$#      Vx        Vy        Vz
       0.0       0.0     4.429
$²
$===============================================================================
$ The edges of the grillage are clamped
$===============================================================================
$
*BOUNDARY_SPC_SET
$#    nsid       cid      dofx      dofy      dofz     dofrx     dofry     dofrz
         1         0         1         1         1         1         1         1
$
$===============================================================================
$ The indenter can only move along Z direction
$===============================================================================
$
$#    nsid       cid      dofx      dofy      dofz     dofrx     dofry     dofrz
         2         0         1         1         0         1         1         1
$
$===============================================================================
$ Contact between the indenter and the grillage
$===============================================================================
$
*CONTACT_AUTOMATIC_SURFACE_TO_SURFACE_ID
$#     cid                                                                 title
         2Indenter-grillage
$#    ssid      msid     sstyp     mstyp    sboxid    mboxid       spr       mpr
         4         1         3         2         0         0         0         0
$#      fs        fd        dc        vc       vdc    penchk        bt        dt
       0.3       0.0       0.0       0.0       0.0         0       0.01.00000E20
$#     sfs       sfm       sst       mst      sfst      sfmt       fsf       vsf
       1.0       1.0       0.0       0.0       1.0       1.0       1.0       1.0
$
$===============================================================================
$ Define a set of all the parts of the grillage
$===============================================================================
$
*SET_PART_LIST_TITLE
Set_Ship
$#     sid       da1       da2       da3       da4    solver      
         1       0.0       0.0       0.0       0.0MECH
$#    pid1      pid2      pid3      pid4      pid5      pid6      pid7      pid8
         1         2         3         0         0         0         0         0
$===============================================================================
$ Define an auto contact on all parts of the grillage
$===============================================================================
$
*CONTACT_AUTOMATIC_GENERAL_ID
$#     cid                                                                 title
         3 grillage autocontact
$
$#    ssid      msid     sstyp     mstyp    sboxid    mboxid       spr       mpr
         1         0         2         0         0         0         0         0
$#      fs        fd        dc        vc       vdc    penchk        bt        dt
       0.3       0.0       0.0       0.0       0.0         0       0.01.00000E20
$#     sfs       sfm       sst       mst      sfst      sfmt       fsf       vsf
       1.0       1.0       0.0       0.0       1.0       1.0       1.0       1.0
$
$===============================================================================
$ Define the PART related to the plate
$===============================================================================
$
*PART
$#                                                                         title
Plate
$#     pid     secid       mid     eosid      hgid      grav    adpopt      tmid
         1         1         1         0         0         0         0         0
$ -----------------------------
$ Define the section (tk=7.9mm)
$ -----------------------------
*SECTION_SHELL_TITLE
Section_Plate
$#   secid    elform      shrf       nip     propt   qr/irid     icomp     setyp
         1         2       0.0         5       1.0         0         0         1
$#      t1        t2        t3        t4      nloc     marea      idof    edgset
    0.0079    0.0079    0.0079    0.0079       0.0       0.0       0.0         0
$
$ ---------------------------------------------
$ Define an elastic plastic material (number 1)
$ The failure strain is set to 0.207
$ ---------------------------------------------
*MAT_PIECEWISE_LINEAR_PLASTICITY_TITLE
S235_Fail
$#     mid        ro         e        pr      sigy      etan      fail      tdel
         1    7850.0    2.1E11      0.33     2.4E8    1.01E9     0.207       0.0
$#       c         p      lcss      lcsr        vp       lcf   
       0.0       0.0         0         0       0.0         0
$#    eps1      eps2      eps3      eps4      eps5      eps6      eps7      eps8
       0.0       0.0       0.0       0.0       0.0       0.0       0.0       0.0
$#     es1       es2       es3       es4       es5       es6       es7       es8
       0.0       0.0       0.0       0.0       0.0       0.0       0.0       0.0
$
$===============================================================================
$ Define the PART that includes all the webs
$===============================================================================
$
*PART
$#                                                                         title
webs
$ Elements and Element Properties for region : web
$#     pid     secid       mid     eosid      hgid      grav    adpopt      tmid
         2         2         2         0         0         0         0         0
$
$ -----------------------------
$ Define the section (tk=7.9mm)
$ -----------------------------
*SECTION_SHELL_TITLE
webs
$#   secid    elform      shrf       nip     propt   qr/irid     icomp     setyp
         2         2       0.0         5       1.0         0         0         1
$#      t1        t2        t3        t4      nloc     marea      idof    edgset
    0.0079    0.0079    0.0079    0.0079       0.0       0.0       0.0         0
$
$ ---------------------------------------------------------------------------------
$ Define an elastic plastic material(number 2) for the webs and flanges 
$ The failure strain is set to 0 because failure strain formula applies only
$ for membrane tension deformation mode, which is not the case for webs and flanges
$ ---------------------------------------------------------------------------------
*MAT_PIECEWISE_LINEAR_PLASTICITY_TITLE
S235_Fail
$#     mid        ro         e        pr      sigy      etan      fail      tdel
         2    7850.0    2.1E11      0.33     2.4E8   1.018E9       0.0       0.0
$#       c         p      lcss      lcsr        vp       lcf   
       0.0       0.0         0         0       0.0         0
$#    eps1      eps2      eps3      eps4      eps5      eps6      eps7      eps8
       0.0       0.0       0.0       0.0       0.0       0.0       0.0       0.0
$#     es1       es2       es3       es4       es5       es6       es7       es8
       0.0       0.0       0.0       0.0       0.0       0.0       0.0       0.0
$
$===============================================================================
$ Define the part that includes all the flanges
$===============================================================================
$
*PART
$#                                                                         title
flanges
$ Elements and Element Properties for region : flange
$#     pid     secid       mid     eosid      hgid      grav    adpopt      tmid
         3         3         2         0         0         0         0         0
$
$ -----------------------------
$ Define the section (tk=7.9mm)
$ -----------------------------
*SECTION_SHELL_TITLE
flanges
$#   secid    elform      shrf       nip     propt   qr/irid     icomp     setyp
         3         2       0.0         5       1.0         0         0         1
$#      t1        t2        t3        t4      nloc     marea      idof    edgset
    0.0079    0.0079    0.0079    0.0079       0.0       0.0       0.0         0
$
$===============================================================================
$ Define the indentera assumed as rigid
$===============================================================================
$
*PART
$#                                                                         title
Indenter
$#     pid     secid       mid     eosid      hgid      grav    adpopt      tmid
         4         4         3         0         0         0         0         0
$
$ ------------------
$ Define the section
$ ------------------
*SECTION_SHELL_TITLE
Section_Indenter
$#   secid    elform      shrf       nip     propt   qr/irid     icomp     setyp
         4         2       0.0         5       1.0         0         0         1
$#      t1        t2        t3        t4      nloc     marea      idof    edgset
      0.01      0.01      0.01      0.01       0.0       0.0       0.0         0
$
$ ------------------------------------------------------
$ Define a rigid material (number 3)
$ the density is increased to obtain a identer of 9 tons
$ new density = 7850 * 9000 / 7.793 = 9 065 828 Kg/m3
$ ------------------------------------------------------
$
*MAT_RIGID_TITLE
Material_indenter
$#     mid        ro         e        pr         n    couple         m     alias
         3 9065828.0   2.10E11       0.3       0.0       0.0       0.0          
$#     cmo      con1      con2    
       0.0         0         0
$#lco or a1        a2        a3        v1        v2        v3  
       0.0       0.0       0.0       0.0       0.0       0.0
$
$
$===============================================================================
$ Transformation for the grillage
$===============================================================================
$
*DEFINE_TRANSFORMATION
$  TRANID|
$#  tranid      
         1
$  OPTION|       A1|       A2|       A3|       A4|       A5|       A6|       A7|
$#  option        a1        a2        a3        a4        a5        a6        a7
ROTATE           1.0       0.0       0.0       0.0       0.0       0.0       0.0
$  OPTION|       A1|       A2|       A3|
TRANSL           0.0       0.0       0.0       0.0       0.0       0.0       0.0
$===============================================================================
$ Transformation for the indenter
$===============================================================================
$
*DEFINE_TRANSFORMATION
$  TRANID|
$#  tranid      
         2
$#  option        a1        a2        a3        a4        a5        a6        a7
ROTATE          -1.0       0.0       0.0       0.0       0.0       0.0       0.0
TRANSL         1.016      0.68     -1.18       0.0       0.0       0.0       0.0
$
$===============================================================================
$ Include the file that contains the mesh of the grillage
$===============================================================================
$
*INCLUDE_TRANSFORM
$#                                                                              
Plate20.k
$
$  IDNOFF|   IDEOFF|   IDPOFF|   IDMOFF|   IDSOFF|   IDFOFF|   IDDOFF|
$#  idnoff    ideoff    idpoff    idmoff    idsoff    idfoff    iddoff      
         0         0         0         0         0         0         0
$  IDROFF|
$#  idroff      
         0
$  FCTMAS|   FCTTIM|   FCTLEN|   FCTTEM|  INCOUT1|
$#  fctmas    fcttim    fctlen    fcttem   incout1    unused      
       1.0       1.0       1.0       1.0         1          
$  TRANID|
$#  tranid      
         1
$
$===============================================================================
$ Include the file that contains the mesh of the indenter
$===============================================================================
$
*INCLUDE_TRANSFORM
$#                                                                              
IndenterRough20.k
$
$#  idnoff    ideoff    idpoff    idmoff    idsoff    idfoff    iddoff      
   9999999   9999999         3         0         1         0         0
$#  idroff      
         0
$#  fctmas    fcttim    fctlen    fcttem   incout1    unused      
       1.0       1.0       1.0      1.0          1          
$#  tranid      
         2
*END
