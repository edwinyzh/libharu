{*
 * << Haru Free PDF Library >> -- hpdf.pas
 *
 * URL: http://libharu.org
 *
 * Copyright (c) 1999-2006 Takeshi Kanno <takeshi_kanno@est.hi-ho.ne.jp>
 * Copyright (c) 2007-2009 Antony Dovgal <tony@daylessday.org>
 *
 * Permission to use, copy, modify, distribute and sell this software
 * and its documentation for any purpose is hereby granted without fee,
 * provided that the above copyright notice appear in all copies and
 * that both that copyright notice and this permission notice appear
 * in supporting documentation.
 * It is provided "as is" without express or implied warranty.
 *
 *}

unit hpdf;

interface

uses
  SysUtils, hpdf_types;

const
{$IFDEF Linux}
  LIBHPDF_DLL = 'libhpdf.so';
{$ELSE}
  LIBHPDF_DLL = 'libhpdf.dll';
{$ENDIF}

type
  HPDF_HANDLE = Pointer;
  HPDF_Doc = HPDF_HANDLE;
  HPDF_Page = HPDF_HANDLE;
  HPDF_Pages = HPDF_HANDLE;
  HPDF_Stream = HPDF_HANDLE;
  HPDF_Image = HPDF_HANDLE;
  HPDF_Font = HPDF_HANDLE;
  HPDF_Outline = HPDF_HANDLE;
  HPDF_Encoder = HPDF_HANDLE;
  HPDF_3DMeasure = HPDF_HANDLE;
  HPDF_ExData = HPDF_HANDLE;
  HPDF_Destination = HPDF_HANDLE;
  HPDF_XObject = HPDF_HANDLE;
  HPDF_Annotation = HPDF_HANDLE;
  HPDF_ExtGState = HPDF_HANDLE;
  HPDF_FontDef = HPDF_HANDLE;
  HPDF_U3D = HPDF_HANDLE;
  HPDF_JavaScript = HPDF_HANDLE;
  HPDF_Error = HPDF_HANDLE;
  HPDF_MMgr = HPDF_HANDLE;
  HPDF_Dict = HPDF_HANDLE;
  HPDF_EmbeddedFile = HPDF_HANDLE;
  HPDF_OutputIntent = HPDF_HANDLE;
  HPDF_Xref = HPDF_HANDLE;
  HPDF_STATUS = Cardinal;


function HPDF_GetVersion(): HPDF_PCHAR; {$IFDEF Linux}cdecl{$ELSE}stdcall{$ENDIF} external LIBHPDF_DLL;


function HPDF_NewEx (user_error_fn: THPDF_Error_Handler;
        user_alloc_fn: THPDF_Alloc_Func; user_free_fn: THPDF_Free_Func;
        mem_pool_buf_size: HPDF_UINT; user_data: Pointer): HPDF_Doc;
         {$IFDEF Linux}cdecl{$ELSE}stdcall{$ENDIF} external LIBHPDF_DLL;


function HPDF_New (user_error_fn: THPDF_Error_Handler; user_data: Pointer): HPDF_Doc;
         {$IFDEF Linux}cdecl{$ELSE}stdcall{$ENDIF} external LIBHPDF_DLL;


function HPDF_SetErrorHandler (pdf: HPDF_Doc; user_error_fn: THPDF_Error_Handler):
        HPDF_STATUS; {$IFDEF Linux}cdecl{$ELSE}stdcall{$ENDIF} external LIBHPDF_DLL;


procedure HPDF_Free (pdf: HPDF_Doc); {$IFDEF Linux}cdecl{$ELSE}stdcall{$ENDIF} external LIBHPDF_DLL;


function HPDF_NewDoc (pdf: HPDF_Doc): HPDF_STATUS; {$IFDEF Linux}cdecl{$ELSE}stdcall{$ENDIF} external LIBHPDF_DLL;


procedure HPDF_FreeDoc (pdf: HPDF_Doc); {$IFDEF Linux}cdecl{$ELSE}stdcall{$ENDIF} external LIBHPDF_DLL;


function HPDF_HasDoc (pdf: HPDF_Doc): HPDF_BOOL; {$IFDEF Linux}cdecl{$ELSE}stdcall{$ENDIF} external LIBHPDF_DLL;


procedure HPDF_FreeDocAll (pdf: HPDF_Doc); {$IFDEF Linux}cdecl{$ELSE}stdcall{$ENDIF} external LIBHPDF_DLL;


function HPDF_LimitVersion (pdf: HPDF_Doc; max_ver: THPDF_PdfVer): HPDF_STATUS;
         {$IFDEF Linux}cdecl{$ELSE}stdcall{$ENDIF} external LIBHPDF_DLL;


function HPDF_SaveToStream (pdf: HPDF_Doc): HPDF_STATUS;
         {$IFDEF Linux}cdecl{$ELSE}stdcall{$ENDIF} external LIBHPDF_DLL;


function HPDF_GetContents (pdf: HPDF_Doc; buf: HPDF_PBYTE; size: HPDF_PUINT32): HPDF_STATUS;
         {$IFDEF Linux}cdecl{$ELSE}stdcall{$ENDIF} external LIBHPDF_DLL;


function HPDF_GetStreamSize (pdf: HPDF_Doc): HPDF_UINT32;
         {$IFDEF Linux}cdecl{$ELSE}stdcall{$ENDIF} external LIBHPDF_DLL;


function HPDF_ReadFromStream (pdf: HPDF_Doc; buf: HPDF_PBYTE; 
         size: HPDF_PUINT): HPDF_STATUS; {$IFDEF Linux}cdecl{$ELSE}stdcall{$ENDIF} external LIBHPDF_DLL;


function HPDF_ResetStream (pdf: HPDF_Doc): HPDF_STATUS;
         {$IFDEF Linux}cdecl{$ELSE}stdcall{$ENDIF} external LIBHPDF_DLL;


function HPDF_SaveToFile (pdf: HPDF_Doc; const file_name: HPDF_PCHAR): HPDF_STATUS;
         {$IFDEF Linux}cdecl{$ELSE}stdcall{$ENDIF} external LIBHPDF_DLL;


function HPDF_GetError (pdf: HPDF_Doc): HPDF_STATUS; {$IFDEF Linux}cdecl{$ELSE}stdcall{$ENDIF} external LIBHPDF_DLL;


function HPDF_GetErrorDetail (pdf: HPDF_Doc): HPDF_STATUS; {$IFDEF Linux}cdecl{$ELSE}stdcall{$ENDIF} external LIBHPDF_DLL;


procedure HPDF_ResetError (pdf: HPDF_Doc); {$IFDEF Linux}cdecl{$ELSE}stdcall{$ENDIF} external LIBHPDF_DLL;


function HPDF_CheckError (error: HPDF_Error): HPDF_STATUS; {$IFDEF Linux}cdecl{$ELSE}stdcall{$ENDIF} external LIBHPDF_DLL;


function HPDF_SetPagesConfiguration (pdf: HPDF_Doc; page_per_pages: HPDF_UINT):
        HPDF_STATUS; {$IFDEF Linux}cdecl{$ELSE}stdcall{$ENDIF} external LIBHPDF_DLL;


function HPDF_GetPageByIndex (pdf: HPDF_Doc; index: HPDF_UINT): HPDF_Page;
         {$IFDEF Linux}cdecl{$ELSE}stdcall{$ENDIF} external LIBHPDF_DLL;


function HPDF_GetPageMMgr (page: HPDF_Page): HPDF_MMgr;
         {$IFDEF Linux}cdecl{$ELSE}stdcall{$ENDIF} external LIBHPDF_DLL;


function HPDF_GetPageLayout (pdf: HPDF_Doc): THPDF_PageLayout;
         {$IFDEF Linux}cdecl{$ELSE}stdcall{$ENDIF} external LIBHPDF_DLL;


function HPDF_SetPageLayout (pdf: HPDF_Doc; layout: THPDF_PageLayout): HPDF_STATUS;
         {$IFDEF Linux}cdecl{$ELSE}stdcall{$ENDIF} external LIBHPDF_DLL;


function HPDF_GetPageMode (pdf: HPDF_Doc): THPDF_PageMode;
         {$IFDEF Linux}cdecl{$ELSE}stdcall{$ENDIF} external LIBHPDF_DLL;


function HPDF_SetPageMode (pdf: HPDF_Doc; mode: THPDF_PageMode): HPDF_STATUS;
         {$IFDEF Linux}cdecl{$ELSE}stdcall{$ENDIF} external LIBHPDF_DLL;


function HPDF_GetViewerPreference (pdf: HPDF_Doc): HPDF_UINT;
         {$IFDEF Linux}cdecl{$ELSE}stdcall{$ENDIF} external LIBHPDF_DLL;


function HPDF_SetViewerPreference (pdf: HPDF_Doc; value: HPDF_UINT): HPDF_STATUS;
         {$IFDEF Linux}cdecl{$ELSE}stdcall{$ENDIF} external LIBHPDF_DLL;


function HPDF_SetOpenAction (pdf: HPDF_Doc; open_action: HPDF_Destination):
        HPDF_STATUS; {$IFDEF Linux}cdecl{$ELSE}stdcall{$ENDIF} external LIBHPDF_DLL;


function HPDF_GetCurrentPage (pdf: HPDF_Doc): HPDF_Page;
         {$IFDEF Linux}cdecl{$ELSE}stdcall{$ENDIF} external LIBHPDF_DLL;


function HPDF_AddPage (pdf: HPDF_Doc): HPDF_Page; {$IFDEF Linux}cdecl{$ELSE}stdcall{$ENDIF} external LIBHPDF_DLL;


function HPDF_InsertPage (pdf: HPDF_Doc; page: HPDF_Page): HPDF_Page;
         {$IFDEF Linux}cdecl{$ELSE}stdcall{$ENDIF} external LIBHPDF_DLL;


function HPDF_Page_SetWidth (page: HPDF_Page; value: HPDF_REAL): HPDF_STATUS;
         {$IFDEF Linux}cdecl{$ELSE}stdcall{$ENDIF} external LIBHPDF_DLL;


function HPDF_Page_SetHeight (page: HPDF_Page; value: HPDF_REAL): HPDF_STATUS;
         {$IFDEF Linux}cdecl{$ELSE}stdcall{$ENDIF} external LIBHPDF_DLL;


function HPDF_Page_SetSize (page: HPDF_Page; size: THPDF_PageSizes;
        direction: THPDF_PageDirection): HPDF_STATUS; {$IFDEF Linux}cdecl{$ELSE}stdcall{$ENDIF} external LIBHPDF_DLL;


function HPDF_Page_SetRotate (page: HPDF_Page; angle: HPDF_UINT16): HPDF_STATUS;
         {$IFDEF Linux}cdecl{$ELSE}stdcall{$ENDIF} external LIBHPDF_DLL;


function HPDF_Page_SetZoom (page: HPDF_Page; zoom: HPDF_REAL): HPDF_STATUS;
         {$IFDEF Linux}cdecl{$ELSE}stdcall{$ENDIF} external LIBHPDF_DLL;


function HPDF_GetFont (pdf: HPDF_Doc; const font_name: HPDF_PCHAR;
        const encoding_name: HPDF_PCHAR): HPDF_Font; {$IFDEF Linux}cdecl{$ELSE}stdcall{$ENDIF} external LIBHPDF_DLL;


function HPDF_LoadType1FontFromFile (pdf: HPDF_Doc; afmfilename: HPDF_PCHAR;
        pfmfilename: HPDF_PCHAR): HPDF_PCHAR; {$IFDEF Linux}cdecl{$ELSE}stdcall{$ENDIF} external LIBHPDF_DLL;


function HPDF_GetTTFontDefFromFile (pdf: HPDF_Doc; const file_name: HPDF_PCHAR;
        options: HPDF_INT): HPDF_FontDef; {$IFDEF Linux}cdecl{$ELSE}stdcall{$ENDIF} external LIBHPDF_DLL;


function HPDF_LoadTTFontFromFile (pdf: HPDF_Doc; const file_name: HPDF_PCHAR;
        options: HPDF_INT): HPDF_PCHAR; {$IFDEF Linux}cdecl{$ELSE}stdcall{$ENDIF} external LIBHPDF_DLL;


function HPDF_LoadTTFontFromFile2 (pdf: HPDF_Doc; const file_name: HPDF_PCHAR;
        index: HPDF_UINT; options: HPDF_INT): HPDF_PCHAR;
         {$IFDEF Linux}cdecl{$ELSE}stdcall{$ENDIF} external LIBHPDF_DLL;

function HPDF_AddPageLabel (pdf: HPDF_Doc; page_num: HPDF_UINT;
        style: THPDF_PageNumStyle; first_page: HPDF_UINT; const prefix: HPDF_PCHAR):
        HPDF_STATUS; {$IFDEF Linux}cdecl{$ELSE}stdcall{$ENDIF} external LIBHPDF_DLL;


function HPDF_UseJPFonts (pdf: HPDF_Doc): HPDF_STATUS;
         {$IFDEF Linux}cdecl{$ELSE}stdcall{$ENDIF} external LIBHPDF_DLL;


function HPDF_UseKRFonts (pdf: HPDF_Doc): HPDF_STATUS;
         {$IFDEF Linux}cdecl{$ELSE}stdcall{$ENDIF} external LIBHPDF_DLL;


function HPDF_UseCNSFonts (pdf: HPDF_Doc): HPDF_STATUS;
         {$IFDEF Linux}cdecl{$ELSE}stdcall{$ENDIF} external LIBHPDF_DLL;


function HPDF_UseCNTFonts (pdf: HPDF_Doc): HPDF_STATUS;
         {$IFDEF Linux}cdecl{$ELSE}stdcall{$ENDIF} external LIBHPDF_DLL;


function HPDF_CreateOutline (pdf: HPDF_Doc; parent: HPDF_Outline;
        const title: HPDF_PCHAR; encoder: HPDF_Encoder): HPDF_Outline;
         {$IFDEF Linux}cdecl{$ELSE}stdcall{$ENDIF} external LIBHPDF_DLL;


function HPDF_Outline_SetOpened (outline: HPDF_Outline; opened: HPDF_BOOL):
        HPDF_STATUS; {$IFDEF Linux}cdecl{$ELSE}stdcall{$ENDIF} external LIBHPDF_DLL;


function HPDF_Outline_SetDestination (outline: HPDF_Outline;
        dst: HPDF_Destination): HPDF_STATUS; {$IFDEF Linux}cdecl{$ELSE}stdcall{$ENDIF} external LIBHPDF_DLL;


function HPDF_Page_CreateDestination (page: HPDF_Page): HPDF_Destination;
         {$IFDEF Linux}cdecl{$ELSE}stdcall{$ENDIF} external LIBHPDF_DLL;


function HPDF_Destination_SetXYZ (dst: HPDF_Destination; left: HPDF_REAL;
        top: HPDF_REAL; zoom: HPDF_REAL): HPDF_STATUS; {$IFDEF Linux}cdecl{$ELSE}stdcall{$ENDIF} external LIBHPDF_DLL;


function HPDF_Destination_SetFit (dst: HPDF_Destination): HPDF_STATUS;
         {$IFDEF Linux}cdecl{$ELSE}stdcall{$ENDIF} external LIBHPDF_DLL;


function HPDF_Destination_SetFitH (dst: HPDF_Destination; top: HPDF_REAL):
        HPDF_STATUS; {$IFDEF Linux}cdecl{$ELSE}stdcall{$ENDIF} external LIBHPDF_DLL;


function HPDF_Destination_SetFitV (dst: HPDF_Destination; left: HPDF_REAL):
        HPDF_STATUS; {$IFDEF Linux}cdecl{$ELSE}stdcall{$ENDIF} external LIBHPDF_DLL;


function HPDF_Destination_SetFitR (dst: HPDF_Destination; left: HPDF_REAL;
        bottom: HPDF_REAL; right: HPDF_REAL; top: HPDF_REAL): HPDF_STATUS;
         {$IFDEF Linux}cdecl{$ELSE}stdcall{$ENDIF} external LIBHPDF_DLL;


function HPDF_Destination_SetFitB (dst: HPDF_Destination): HPDF_STATUS;
         {$IFDEF Linux}cdecl{$ELSE}stdcall{$ENDIF} external LIBHPDF_DLL;


function HPDF_Destination_SetFitBH (dst: HPDF_Destination; top: HPDF_REAL):
        HPDF_STATUS; {$IFDEF Linux}cdecl{$ELSE}stdcall{$ENDIF} external LIBHPDF_DLL;


function HPDF_Destination_SetFitBV (dst: HPDF_Destination; left: HPDF_REAL):
        HPDF_STATUS; {$IFDEF Linux}cdecl{$ELSE}stdcall{$ENDIF} external LIBHPDF_DLL;


function HPDF_GetEncoder (pdf: HPDF_Doc; const encoding_name: HPDF_PCHAR):
        HPDF_Encoder; {$IFDEF Linux}cdecl{$ELSE}stdcall{$ENDIF} external LIBHPDF_DLL;


function HPDF_GetCurrentEncoder (pdf: HPDF_Doc): HPDF_Encoder;
         {$IFDEF Linux}cdecl{$ELSE}stdcall{$ENDIF} external LIBHPDF_DLL;


function HPDF_SetCurrentEncoder (pdf: HPDF_Doc; const encoding_name: HPDF_PCHAR):
        HPDF_STATUS; {$IFDEF Linux}cdecl{$ELSE}stdcall{$ENDIF} external LIBHPDF_DLL;


function HPDF_Encoder_GetType (encoder: HPDF_Encoder): THPDF_EncoderType;
         {$IFDEF Linux}cdecl{$ELSE}stdcall{$ENDIF} external LIBHPDF_DLL;


// with converter, use HPDF_Font_GetByteType
function HPDF_Encoder_GetByteType (encoder: HPDF_Encoder; const text: HPDF_PCHAR;
        index: HPDF_UINT): THPDF_ByteType; {$IFDEF Linux}cdecl{$ELSE}stdcall{$ENDIF} external LIBHPDF_DLL;


// obsoleted, use HPDF_Encoder_GetUcs4 or HPDF_Font_GetUcs4
function HPDF_Encoder_GetUnicode (encoder: HPDF_Encoder; code: HPDF_UINT16):
        HPDF_UNICODE; {$IFDEF Linux}cdecl{$ELSE}stdcall{$ENDIF} external LIBHPDF_DLL;


// with converter, use HPDF_Font_GetUcs4
function HPDF_Encoder_GetUcs4 (encoder: HPDF_Encoder; const text: HPDF_PCHAR; bytes: HPDF_PUINT):
        HPDF_UCS4; {$IFDEF Linux}cdecl{$ELSE}stdcall{$ENDIF} external LIBHPDF_DLL;


function HPDF_Encoder_GetWritingMode (encoder: HPDF_Encoder): THPDF_WritingMode;
         {$IFDEF Linux}cdecl{$ELSE}stdcall{$ENDIF} external LIBHPDF_DLL;


function HPDF_UseJPEncodings (pdf: HPDF_Doc): HPDF_STATUS;
         {$IFDEF Linux}cdecl{$ELSE}stdcall{$ENDIF} external LIBHPDF_DLL;


function HPDF_UseKREncodings (pdf: HPDF_Doc): HPDF_STATUS;
         {$IFDEF Linux}cdecl{$ELSE}stdcall{$ENDIF} external LIBHPDF_DLL;


function HPDF_UseCNSEncodings (pdf: HPDF_Doc): HPDF_STATUS;
         {$IFDEF Linux}cdecl{$ELSE}stdcall{$ENDIF} external LIBHPDF_DLL;


function HPDF_UseCNTEncodings (pdf: HPDF_Doc): HPDF_STATUS;
         {$IFDEF Linux}cdecl{$ELSE}stdcall{$ENDIF} external LIBHPDF_DLL;


function HPDF_UseUTFEncodings (pdf: HPDF_Doc): HPDF_STATUS;
         {$IFDEF Linux}cdecl{$ELSE}stdcall{$ENDIF} external LIBHPDF_DLL;


function HPDF_GetUTFEncoder (pdf: HPDF_Doc; charenc: THPDF_CharEnc): HPDF_Encoder;
         {$IFDEF Linux}cdecl{$ELSE}stdcall{$ENDIF} external LIBHPDF_DLL;


function HPDF_Page_CreateXObjectFromImage (pdf: HPDF_Doc; page: HPDF_Page; rect: THPDF_Rect;
        image: HPDF_Image; zoom: HPDF_BOOL): HPDF_XObject;
         {$IFDEF Linux}cdecl{$ELSE}stdcall{$ENDIF} external LIBHPDF_DLL;


function HPDF_Page_CreateXObjectAsWhiteRect (pdf: HPDF_Doc; page: HPDF_Page; rect: THPDF_Rect):
        HPDF_XObject; {$IFDEF Linux}cdecl{$ELSE}stdcall{$ENDIF} external LIBHPDF_DLL;


function HPDF_Page_Create3DAnnot (page: HPDF_Page; rect: THPDF_Rect;
        tb: HPDF_BOOL; np: HPDF_BOOL; u3d: HPDF_U3D; ap: HPDF_Image): HPDF_Annotation;
         {$IFDEF Linux}cdecl{$ELSE}stdcall{$ENDIF} external LIBHPDF_DLL;


function HPDF_Page_CreateTextAnnot (page: HPDF_Page; rect: THPDF_Rect;
        const text: HPDF_PCHAR; encoder: HPDF_Encoder): HPDF_Annotation;
         {$IFDEF Linux}cdecl{$ELSE}stdcall{$ENDIF} external LIBHPDF_DLL;


function HPDF_Page_CreateFreeTextAnnot (page: HPDF_Page; rect: THPDF_Rect;
        const text: HPDF_PCHAR; encoder: HPDF_Encoder): HPDF_Annotation;
         {$IFDEF Linux}cdecl{$ELSE}stdcall{$ENDIF} external LIBHPDF_DLL;


function HPDF_Page_CreateLineAnnot (page: HPDF_Page; const text: HPDF_PCHAR;
        encoder: HPDF_Encoder): HPDF_Annotation; {$IFDEF Linux}cdecl{$ELSE}stdcall{$ENDIF} external LIBHPDF_DLL;


function HPDF_Page_CreateWidgetAnnot_WhiteOnlyWhilePrint (pdf: HPDF_Doc; page: HPDF_Page;
        rect: THPDF_Rect): HPDF_Annotation; {$IFDEF Linux}cdecl{$ELSE}stdcall{$ENDIF} external LIBHPDF_DLL;


function HPDF_Page_CreateWidgetAnnot (page: HPDF_Page; rect: THPDF_Rect): HPDF_Annotation;
         {$IFDEF Linux}cdecl{$ELSE}stdcall{$ENDIF} external LIBHPDF_DLL;


function HPDF_Page_CreateLinkAnnot (page: HPDF_Page; rect: THPDF_Rect;
        dst: HPDF_Destination): HPDF_Annotation; {$IFDEF Linux}cdecl{$ELSE}stdcall{$ENDIF} external LIBHPDF_DLL;


function HPDF_Page_CreateURILinkAnnot (page: HPDF_Page; rect: THPDF_Rect;
        const uri: HPDF_PCHAR): HPDF_Annotation; {$IFDEF Linux}cdecl{$ELSE}stdcall{$ENDIF} external LIBHPDF_DLL;


function HPDF_Page_CreateHighlightAnnot (page: HPDF_Page; rect: THPDF_Rect;
        const text: HPDF_PCHAR; encoder: HPDF_Encoder): HPDF_Annotation; {$IFDEF Linux}cdecl{$ELSE}stdcall{$ENDIF} external LIBHPDF_DLL;


function HPDF_Page_CreateUnderlineAnnot (page: HPDF_Page; rect: THPDF_Rect;
        const text: HPDF_PCHAR; encoder: HPDF_Encoder): HPDF_Annotation; {$IFDEF Linux}cdecl{$ELSE}stdcall{$ENDIF} external LIBHPDF_DLL;


function HPDF_Page_CreateSquigglyAnnot (page: HPDF_Page; rect: THPDF_Rect;
        const text: HPDF_PCHAR; encoder: HPDF_Encoder): HPDF_Annotation; {$IFDEF Linux}cdecl{$ELSE}stdcall{$ENDIF} external LIBHPDF_DLL;


function HPDF_Page_CreateStrikeOutAnnot (page: HPDF_Page; rect: THPDF_Rect;
        const text: HPDF_PCHAR; encoder: HPDF_Encoder): HPDF_Annotation; {$IFDEF Linux}cdecl{$ELSE}stdcall{$ENDIF} external LIBHPDF_DLL;


function HPDF_Page_CreatePopupAnnot (page: HPDF_Page; rect: THPDF_Rect;
        parent: HPDF_Annotation): HPDF_Annotation; {$IFDEF Linux}cdecl{$ELSE}stdcall{$ENDIF} external LIBHPDF_DLL;


function HPDF_Page_CreateStampAnnot (page: HPDF_Page; rect: THPDF_Rect;
        name: THPDF_StampAnnotName; const text: HPDF_PCHAR; encoder: HPDF_Encoder): HPDF_Annotation;
         {$IFDEF Linux}cdecl{$ELSE}stdcall{$ENDIF} external LIBHPDF_DLL;


function HPDF_Page_CreateProjectionAnnot (page: HPDF_Page; rect: THPDF_Rect; const text: HPDF_PCHAR;
        encoder: HPDF_Encoder): HPDF_Annotation; {$IFDEF Linux}cdecl{$ELSE}stdcall{$ENDIF} external LIBHPDF_DLL;


function HPDF_Page_CreateSquareAnnot (page: HPDF_Page; rect: THPDF_Rect; const text: HPDF_PCHAR;
        encoder: HPDF_Encoder): HPDF_Annotation; {$IFDEF Linux}cdecl{$ELSE}stdcall{$ENDIF} external LIBHPDF_DLL;


function HPDF_Page_CreateCircleAnnot (page: HPDF_Page; rect: THPDF_Rect; const text: HPDF_PCHAR;
        encoder: HPDF_Encoder): HPDF_Annotation; {$IFDEF Linux}cdecl{$ELSE}stdcall{$ENDIF} external LIBHPDF_DLL;


function HPDF_LinkAnnot_SetHighlightMode (annot: HPDF_Annotation;
        mode: THPDF_AnnotHighlightMode): HPDF_STATUS; {$IFDEF Linux}cdecl{$ELSE}stdcall{$ENDIF} external LIBHPDF_DLL;


function HPDF_LinkAnnot_SetJavaScript (annot: HPDF_Annotation;
        javascript: HPDF_JavaScript): HPDF_STATUS; {$IFDEF Linux}cdecl{$ELSE}stdcall{$ENDIF} external LIBHPDF_DLL;


function HPDF_LinkAnnot_SetBorderStyle (annot: HPDF_Annotation; width: HPDF_REAL;
        dash_on: HPDF_UINT16; dash_off: HPDF_UINT16): HPDF_STATUS;
         {$IFDEF Linux}cdecl{$ELSE}stdcall{$ENDIF} external LIBHPDF_DLL;


function HPDF_TextAnnot_SetIcon (annot: HPDF_Annotation; icon: THPDF_AnnotIcon):
        HPDF_STATUS; {$IFDEF Linux}cdecl{$ELSE}stdcall{$ENDIF} external LIBHPDF_DLL;


function HPDF_TextAnnot_SetOpened (annot: HPDF_Annotation; opened: HPDF_BOOL):
        HPDF_STATUS; {$IFDEF Linux}cdecl{$ELSE}stdcall{$ENDIF} external LIBHPDF_DLL;


function HPDF_Annot_SetRGBColor (annot: HPDF_Annotation; color: THPDF_RGBColor):
        HPDF_STATUS; {$IFDEF Linux}cdecl{$ELSE}stdcall{$ENDIF} external LIBHPDF_DLL;


function HPDF_Annot_SetCMYKColor (annot: HPDF_Annotation; color: THPDF_CMYKColor):
        HPDF_STATUS; {$IFDEF Linux}cdecl{$ELSE}stdcall{$ENDIF} external LIBHPDF_DLL;


function HPDF_Annot_SetGrayColor (annot: HPDF_Annotation; color: HPDF_REAL):
        HPDF_STATUS; {$IFDEF Linux}cdecl{$ELSE}stdcall{$ENDIF} external LIBHPDF_DLL;


function HPDF_Annot_SetNoColor (annot: HPDF_Annotation):
        HPDF_STATUS; {$IFDEF Linux}cdecl{$ELSE}stdcall{$ENDIF} external LIBHPDF_DLL;


function HPDF_MarkupAnnot_SetTitle (annot: HPDF_Annotation; const name: HPDF_PCHAR):
        HPDF_STATUS; {$IFDEF Linux}cdecl{$ELSE}stdcall{$ENDIF} external LIBHPDF_DLL;


function HPDF_MarkupAnnot_SetSubject (annot: HPDF_Annotation; const name: HPDF_PCHAR):
        HPDF_STATUS; {$IFDEF Linux}cdecl{$ELSE}stdcall{$ENDIF} external LIBHPDF_DLL;


function HPDF_MarkupAnnot_SetCreationDate (annot: HPDF_Annotation; value: THPDF_Date):
        HPDF_STATUS; {$IFDEF Linux}cdecl{$ELSE}stdcall{$ENDIF} external LIBHPDF_DLL;


function HPDF_MarkupAnnot_SetTransparency (annot: HPDF_Annotation; value: HPDF_REAL):
        HPDF_STATUS; {$IFDEF Linux}cdecl{$ELSE}stdcall{$ENDIF} external LIBHPDF_DLL;


function HPDF_MarkupAnnot_SetIntent (annot: HPDF_Annotation; value: THPDF_AnnotIntent):
        HPDF_STATUS; {$IFDEF Linux}cdecl{$ELSE}stdcall{$ENDIF} external LIBHPDF_DLL;


function HPDF_MarkupAnnot_SetPopup (annot: HPDF_Annotation; popup: HPDF_Annotation):
        HPDF_STATUS; {$IFDEF Linux}cdecl{$ELSE}stdcall{$ENDIF} external LIBHPDF_DLL;


function HPDF_MarkupAnnot_SetRectDiff (annot: HPDF_Annotation; rect: THPDF_Rect):
        HPDF_STATUS; {$IFDEF Linux}cdecl{$ELSE}stdcall{$ENDIF} external LIBHPDF_DLL;


function HPDF_MarkupAnnot_SetCloudEffect (annot: HPDF_Annotation; cloudIntensity: HPDF_INT):
        HPDF_STATUS; {$IFDEF Linux}cdecl{$ELSE}stdcall{$ENDIF} external LIBHPDF_DLL;


function HPDF_MarkupAnnot_SetInteriorRGBColor (annot: HPDF_Annotation; color: THPDF_RGBColor):
        HPDF_STATUS; {$IFDEF Linux}cdecl{$ELSE}stdcall{$ENDIF} external LIBHPDF_DLL;


function HPDF_MarkupAnnot_SetInteriorCMYKColor (annot: HPDF_Annotation; color: THPDF_CMYKColor):
        HPDF_STATUS; {$IFDEF Linux}cdecl{$ELSE}stdcall{$ENDIF} external LIBHPDF_DLL;


function HPDF_MarkupAnnot_SetInteriorGrayColor (annot: HPDF_Annotation; color: HPDF_REAL):
        HPDF_STATUS; {$IFDEF Linux}cdecl{$ELSE}stdcall{$ENDIF} external LIBHPDF_DLL;


function HPDF_MarkupAnnot_SetInteriorTransparent (annot: HPDF_Annotation):
        HPDF_STATUS; {$IFDEF Linux}cdecl{$ELSE}stdcall{$ENDIF} external LIBHPDF_DLL;


function HPDF_TextMarkupAnnot_SetQuadPoints (annot: HPDF_Annotation; lb: THPDF_Point; rb: THPDF_Point;
        rt: THPDF_Point; lt: THPDF_Point): HPDF_STATUS; {$IFDEF Linux}cdecl{$ELSE}stdcall{$ENDIF} external LIBHPDF_DLL;


function HPDF_Annot_Set3DView (mmgr: HPDF_MMgr; annot: HPDF_Annotation; annot3d: HPDF_Annotation;
        view: HPDF_Dict): HPDF_STATUS; {$IFDEF Linux}cdecl{$ELSE}stdcall{$ENDIF} external LIBHPDF_DLL;


function HPDF_PopupAnnot_SetOpened (annot: HPDF_Annotation; opened: HPDF_BOOL):
        HPDF_STATUS; {$IFDEF Linux}cdecl{$ELSE}stdcall{$ENDIF} external LIBHPDF_DLL;


function HPDF_FreeTextAnnot_SetLineEndingStyle (annot: HPDF_Annotation;
        startStyle: THPDF_LineAnnotEndingStyle; endStyle: THPDF_LineAnnotEndingStyle): HPDF_STATUS;
        {$IFDEF Linux}cdecl{$ELSE}stdcall{$ENDIF} external LIBHPDF_DLL;


function HPDF_FreeTextAnnot_Set3PointCalloutLine (annot: HPDF_Annotation;
        startPoint: THPDF_Point; kneePoint: THPDF_Point; endPoint: THPDF_Point): HPDF_STATUS;
        {$IFDEF Linux}cdecl{$ELSE}stdcall{$ENDIF} external LIBHPDF_DLL;


function HPDF_FreeTextAnnot_Set2PointCalloutLine (annot: HPDF_Annotation;
        startPoint: THPDF_Point; endPoint: THPDF_Point): HPDF_STATUS;
        {$IFDEF Linux}cdecl{$ELSE}stdcall{$ENDIF} external LIBHPDF_DLL;


function HPDF_FreeTextAnnot_SetDefaultStyle (annot: HPDF_Annotation;
        const style: HPDF_PCHAR): HPDF_STATUS; {$IFDEF Linux}cdecl{$ELSE}stdcall{$ENDIF} external LIBHPDF_DLL;


function HPDF_LineAnnot_SetPosition (annot: HPDF_Annotation;
        startPoint: THPDF_Point; startStyle: THPDF_LineAnnotEndingStyle;
        endPoint: THPDF_Point; endStyle: THPDF_LineAnnotEndingStyle): HPDF_STATUS;
        {$IFDEF Linux}cdecl{$ELSE}stdcall{$ENDIF} external LIBHPDF_DLL;


function HPDF_LineAnnot_SetLeader (annot: HPDF_Annotation; leaderLen: HPDF_INT; leaderExtLen: HPDF_INT;
        leaderOffsetLen: HPDF_INT): HPDF_STATUS; {$IFDEF Linux}cdecl{$ELSE}stdcall{$ENDIF} external LIBHPDF_DLL;


function HPDF_LineAnnot_SetCaption (annot: HPDF_Annotation; showCaption: HPDF_BOOL;
        position: THPDF_LineAnnotCapPosition; horzOffset: HPDF_INT; vertOffset: HPDF_INT):
        HPDF_STATUS; {$IFDEF Linux}cdecl{$ELSE}stdcall{$ENDIF} external LIBHPDF_DLL;


function HPDF_Annotation_SetBorderStyle (annot: HPDF_Annotation; subtype: THPDF_BSSubtype;
        width: HPDF_REAL; dash_on: HPDF_UINT16; dash_off: HPDF_UINT16; dash_phase: HPDF_UINT16):
        HPDF_STATUS; {$IFDEF Linux}cdecl{$ELSE}stdcall{$ENDIF} external LIBHPDF_DLL;


function HPDF_ProjectionAnnot_SetExData (annot: HPDF_Annotation; exdata: HPDF_ExData): HPDF_STATUS;
        {$IFDEF Linux}cdecl{$ELSE}stdcall{$ENDIF} external LIBHPDF_DLL;


function HPDF_Page_Create3DC3DMeasure (page: HPDF_Page; firstanchorpoint: THPDF_Point3D;
        textanchorpoint: THPDF_Point3D): HPDF_3DMeasure; {$IFDEF Linux}cdecl{$ELSE}stdcall{$ENDIF} external LIBHPDF_DLL;


function HPDF_Page_CreatePD33DMeasure (page: HPDF_Page; annotationPlaneNormal: THPDF_Point3D;
        firstAnchorPoint: THPDF_Point3D; secondAnchorPoint: THPDF_Point3D; leaderLinesDirection: THPDF_Point3D;
        measurementValuePoint: THPDF_Point3D; textYDirection: THPDF_Point3D; value: HPDF_REAL;
        const unitsString: HPDF_PCHAR): HPDF_3DMeasure; {$IFDEF Linux}cdecl{$ELSE}stdcall{$ENDIF} external LIBHPDF_DLL;


function HPDF_3DMeasure_SetName (measure: HPDF_3DMeasure; const name: HPDF_PCHAR):
        HPDF_STATUS; {$IFDEF Linux}cdecl{$ELSE}stdcall{$ENDIF} external LIBHPDF_DLL;


function HPDF_3DMeasure_SetColor (measure: HPDF_3DMeasure; color: THPDF_RGBColor):
        HPDF_STATUS; {$IFDEF Linux}cdecl{$ELSE}stdcall{$ENDIF} external LIBHPDF_DLL;


function HPDF_3DMeasure_SetTextSize (measure: HPDF_3DMeasure; textsize: HPDF_REAL):
        HPDF_STATUS; {$IFDEF Linux}cdecl{$ELSE}stdcall{$ENDIF} external LIBHPDF_DLL;


function HPDF_3DC3DMeasure_SetTextBoxSize (measure: HPDF_3DMeasure; x: HPDF_INT32; y: HPDF_INT32):
        HPDF_STATUS; {$IFDEF Linux}cdecl{$ELSE}stdcall{$ENDIF} external LIBHPDF_DLL;


function HPDF_3DC3DMeasure_SetText (measure: HPDF_3DMeasure; const text: HPDF_PCHAR; encoder: HPDF_Encoder):
        HPDF_STATUS; {$IFDEF Linux}cdecl{$ELSE}stdcall{$ENDIF} external LIBHPDF_DLL;


function HPDF_3DC3DMeasure_SetProjectionAnotation (measure: HPDF_3DMeasure;
        projectionanotation: HPDF_Annotation): HPDF_STATUS;
        {$IFDEF Linux}cdecl{$ELSE}stdcall{$ENDIF} external LIBHPDF_DLL;


function HPDF_Page_Create3DAnnotExData (page: HPDF_Page): HPDF_ExData;
         {$IFDEF Linux}cdecl{$ELSE}stdcall{$ENDIF} external LIBHPDF_DLL;


function HPDF_3DAnnotExData_Set3DMeasurement (exdata: HPDF_ExData; measure: HPDF_3DMeasure):
        HPDF_STATUS; {$IFDEF Linux}cdecl{$ELSE}stdcall{$ENDIF} external LIBHPDF_DLL;


function HPDF_Page_Create3DView (page: HPDF_Page; u3d: HPDF_U3D; annot3d: HPDF_Annotation;
        const name: HPDF_PCHAR): HPDF_Dict; {$IFDEF Linux}cdecl{$ELSE}stdcall{$ENDIF} external LIBHPDF_DLL;


function HPDF_3DView_Add3DC3DMeasure (view: HPDF_Dict; measure: HPDF_3DMeasure):
        HPDF_STATUS; {$IFDEF Linux}cdecl{$ELSE}stdcall{$ENDIF} external LIBHPDF_DLL;


function HPDF_LoadPngImageFromMem (pdf: HPDF_Doc; const buffer: HPDF_PBYTE;
        size: HPDF_UINT): HPDF_Image; {$IFDEF Linux}cdecl{$ELSE}stdcall{$ENDIF} external LIBHPDF_DLL;


function HPDF_LoadPngImageFromFile (pdf: HPDF_Doc; filename: HPDF_PCHAR):
        HPDF_Image; {$IFDEF Linux}cdecl{$ELSE}stdcall{$ENDIF} external LIBHPDF_DLL;


function HPDF_LoadPngImageFromFile2 (pdf: HPDF_Doc; filename: HPDF_PCHAR):
        HPDF_Image; {$IFDEF Linux}cdecl{$ELSE}stdcall{$ENDIF} external LIBHPDF_DLL;


function HPDF_LoadJpegImageFromFile (pdf: HPDF_Doc; filename: HPDF_PCHAR):
        HPDF_Image; {$IFDEF Linux}cdecl{$ELSE}stdcall{$ENDIF} external LIBHPDF_DLL;


function HPDF_LoadJpegImageFromMem (pdf: HPDF_Doc; const buffer: HPDF_PBYTE;
        size: HPDF_UINT): HPDF_Image; {$IFDEF Linux}cdecl{$ELSE}stdcall{$ENDIF} external LIBHPDF_DLL;


function HPDF_LoadU3DFromFile (pdf: HPDF_Doc; filename: HPDF_PCHAR):
        HPDF_U3D; {$IFDEF Linux}cdecl{$ELSE}stdcall{$ENDIF} external LIBHPDF_DLL;


function HPDF_LoadU3DFromMem (pdf: HPDF_Doc; const buffer: HPDF_PBYTE;
        size: HPDF_UINT): HPDF_U3D; {$IFDEF Linux}cdecl{$ELSE}stdcall{$ENDIF} external LIBHPDF_DLL;


function HPDF_Image_LoadRaw1BitImageFromMem (pdf: HPDF_Doc; const buf: HPDF_PBYTE;
        width: HPDF_UINT; height: HPDF_UINT; line_width: HPDF_UINT;
        black_is1: HPDF_BOOL; top_is_first: HPDF_BOOL): HPDF_Image;
        {$IFDEF Linux}cdecl{$ELSE}stdcall{$ENDIF} external LIBHPDF_DLL;


function HPDF_LoadRawImageFromFile (pdf: HPDF_Doc; filename: HPDF_PCHAR;
        width: HPDF_UINT; height: HPDF_UINT; color_space: THPDF_ColorSpace):
        HPDF_Image; {$IFDEF Linux}cdecl{$ELSE}stdcall{$ENDIF} external LIBHPDF_DLL;


function HPDF_LoadRawImageFromMem (pdf: HPDF_Doc; const buf: HPDF_PBYTE;
        width: HPDF_UINT; height: HPDF_UINT; color_space: THPDF_ColorSpace;
        bits_per_component: HPDF_UINT): HPDF_Image; {$IFDEF Linux}cdecl{$ELSE}stdcall{$ENDIF} external LIBHPDF_DLL;


function HPDF_Image_AddSMask (image: HPDF_Image; smask: HPDF_Image):
        HPDF_STATUS; {$IFDEF Linux}cdecl{$ELSE}stdcall{$ENDIF} external LIBHPDF_DLL;


function HPDF_Image_GetSize (image: HPDF_Image): THPDF_Point;


function HPDF_Image_GetSize2 (image: HPDF_Image; size: PHPDF_Point): HPDF_STATUS;
         {$IFDEF Linux}cdecl{$ELSE}stdcall{$ENDIF} external LIBHPDF_DLL;


function HPDF_Image_GetWidth (image: HPDF_Image): HPDF_UINT;
         {$IFDEF Linux}cdecl{$ELSE}stdcall{$ENDIF} external LIBHPDF_DLL;


function HPDF_Image_GetHeight (image: HPDF_Image): HPDF_UINT;
         {$IFDEF Linux}cdecl{$ELSE}stdcall{$ENDIF} external LIBHPDF_DLL;


function HPDF_Image_GetBitsPerComponent (image: HPDF_Image): HPDF_UINT;
         {$IFDEF Linux}cdecl{$ELSE}stdcall{$ENDIF} external LIBHPDF_DLL;


function HPDF_Image_GetColorSpace (image: HPDF_Image): HPDF_PCHAR;
         {$IFDEF Linux}cdecl{$ELSE}stdcall{$ENDIF} external LIBHPDF_DLL;


function HPDF_Image_SetColorMask (image: HPDF_Image; rmin: HPDF_UINT;
        rmax: HPDF_UINT; gmin: HPDF_UINT; gmax: HPDF_UINT; bmin: HPDF_UINT;
        bmax: HPDF_UINT): HPDF_STATUS; {$IFDEF Linux}cdecl{$ELSE}stdcall{$ENDIF} external LIBHPDF_DLL;


function HPDF_Image_SetMaskImage (image: HPDF_Image; mask_image: HPDF_Image):
        HPDF_STATUS; {$IFDEF Linux}cdecl{$ELSE}stdcall{$ENDIF} external LIBHPDF_DLL;


function HPDF_SetInfoAttr (pdf: HPDF_Doc; info_type: THPDF_InfoType;
        const value: HPDF_PCHAR): HPDF_STATUS; {$IFDEF Linux}cdecl{$ELSE}stdcall{$ENDIF} external LIBHPDF_DLL;


function HPDF_GetInfoAttr (pdf: HPDF_Doc; info_type: THPDF_InfoType): HPDF_PCHAR;
         {$IFDEF Linux}cdecl{$ELSE}stdcall{$ENDIF} external LIBHPDF_DLL;


function HPDF_SetInfoDateAttr (pdf: HPDF_Doc; info_type: THPDF_InfoType; value: THPDF_Date):
        HPDF_STATUS; {$IFDEF Linux}cdecl{$ELSE}stdcall{$ENDIF} external LIBHPDF_DLL;


function HPDF_SetPassword (pdf: HPDF_Doc; const owner_passwd: HPDF_PCHAR;
        const user_passwd: HPDF_PCHAR): HPDF_STATUS; {$IFDEF Linux}cdecl{$ELSE}stdcall{$ENDIF} external LIBHPDF_DLL;


function HPDF_SetPermission (pdf: HPDF_Doc; permission: HPDF_UINT): HPDF_STATUS;
         {$IFDEF Linux}cdecl{$ELSE}stdcall{$ENDIF} external LIBHPDF_DLL;


function HPDF_SetEncryptionMode (pdf: HPDF_Doc; mode: THPDF_EncryptMode;
        key_len: HPDF_UINT): HPDF_STATUS; {$IFDEF Linux}cdecl{$ELSE}stdcall{$ENDIF} external LIBHPDF_DLL;


function HPDF_SetCompressionMode (pdf: HPDF_Doc; mode: HPDF_UINT): HPDF_STATUS;
         {$IFDEF Linux}cdecl{$ELSE}stdcall{$ENDIF} external LIBHPDF_DLL;


function HPDF_Font_GetFontName (font: HPDF_Font): HPDF_PCHAR;
         {$IFDEF Linux}cdecl{$ELSE}stdcall{$ENDIF} external LIBHPDF_DLL;


function HPDF_Font_GetEncodingName (font: HPDF_Font): HPDF_PCHAR;
         {$IFDEF Linux}cdecl{$ELSE}stdcall{$ENDIF} external LIBHPDF_DLL;


// obsoleted, use HPDF_Font_GetUcs4Width
function HPDF_Font_GetUnicodeWidth (font: HPDF_Font; code: HPDF_UNICODE): HPDF_INT;
         {$IFDEF Linux}cdecl{$ELSE}stdcall{$ENDIF} external LIBHPDF_DLL;


// consider HPDF_Font_GetCharWidth
function HPDF_Font_GetUcs4Width (font: HPDF_Font; ucs4: HPDF_UCS4): HPDF_INT;
         {$IFDEF Linux}cdecl{$ELSE}stdcall{$ENDIF} external LIBHPDF_DLL;


// not fully convert but convert only charenc
function HPDF_Font_GetCharWidth (font: HPDF_Font; const text: HPDF_PCHAR;
         bytes: HPDF_PUINT; ucs4: HPDF_UCS4): HPDF_INT;
         {$IFDEF Linux}cdecl{$ELSE}stdcall{$ENDIF} external LIBHPDF_DLL;


function HPDF_Font_GetBBox (font: HPDF_Font): THPDF_Rect;
         {$IFDEF Linux}cdecl{$ELSE}stdcall{$ENDIF} external LIBHPDF_DLL;


function HPDF_Font_GetAscent (font: HPDF_Font): HPDF_INT;
         {$IFDEF Linux}cdecl{$ELSE}stdcall{$ENDIF} external LIBHPDF_DLL;


function HPDF_Font_GetDescent (font: HPDF_Font): HPDF_INT;
         {$IFDEF Linux}cdecl{$ELSE}stdcall{$ENDIF} external LIBHPDF_DLL;


function HPDF_Font_GetXHeight (font: HPDF_Font): HPDF_UINT;
         {$IFDEF Linux}cdecl{$ELSE}stdcall{$ENDIF} external LIBHPDF_DLL;


function HPDF_Font_GetCapHeight (font: HPDF_Font): HPDF_UINT;
         {$IFDEF Linux}cdecl{$ELSE}stdcall{$ENDIF} external LIBHPDF_DLL;


function HPDF_Font_TextWidth  (font: HPDF_Font; const text: HPDF_PCHAR; len: HPDF_UINT): THPDF_TextWidth;
         {$IFDEF Linux}cdecl{$ELSE}stdcall{$ENDIF} external LIBHPDF_DLL;


function HPDF_Font_MeasureText (font: HPDF_Font; const text: HPDF_PCHAR; len: HPDF_UINT;
        width: HPDF_REAL; font_size: HPDF_REAL; char_space: HPDF_REAL;
        word_space: HPDF_REAL; options: HPDF_INT; real_width: HPDF_PREAL) : HPDF_UINT;
        {$IFDEF Linux}cdecl{$ELSE}stdcall{$ENDIF} external LIBHPDF_DLL;


function HPDF_Font_MeasureTextLines (font: HPDF_Font; const text: HPDF_PCHAR; len: HPDF_UINT;
        line_width: HPDF_REAL; font_size: HPDF_REAL; char_space: HPDF_REAL; word_space: HPDF_REAL;
        options: HPDF_INT; width: THPDF_TextLineWidth; max_lines: HPDF_UINT) : HPDF_UINT;
        {$IFDEF Linux}cdecl{$ELSE}stdcall{$ENDIF} external LIBHPDF_DLL;


function HPDF_Font_SetTatweelCount  (font: HPDF_Font; dst_tatweels: HPDF_UINT; src_tatweels: HPDF_UINT;
        numchars: HPDF_UINT): HPDF_STATUS; {$IFDEF Linux}cdecl{$ELSE}stdcall{$ENDIF} external LIBHPDF_DLL;


function HPDF_Font_SelectConverters  (font: HPDF_Font; index: HPDF_INT): HPDF_STATUS;
         {$IFDEF Linux}cdecl{$ELSE}stdcall{$ENDIF} external LIBHPDF_DLL;


function HPDF_Font_SetCharacterEncoding  (font: HPDF_Font; charenc: THPDF_CharEnc): HPDF_STATUS;
         {$IFDEF Linux}cdecl{$ELSE}stdcall{$ENDIF} external LIBHPDF_DLL;


function HPDF_Font_PushConverter  (font: HPDF_Font; new_fn: THPDF_Converter_New_Func; param: Pointer):
        HPDF_STATUS; {$IFDEF Linux}cdecl{$ELSE}stdcall{$ENDIF} external LIBHPDF_DLL;


function HPDF_Font_PushBuiltInConverter  (font: HPDF_Font; const name: HPDF_PCHAR; param: Pointer):
        HPDF_STATUS; {$IFDEF Linux}cdecl{$ELSE}stdcall{$ENDIF} external LIBHPDF_DLL;


function HPDF_Font_GetByteType  (font: HPDF_Font; const text: HPDF_PCHAR; index: HPDF_UINT):
        THPDF_ByteType; {$IFDEF Linux}cdecl{$ELSE}stdcall{$ENDIF} external LIBHPDF_DLL;


// not fully convert but convert only charenc
function HPDF_Font_GetUcs4  (font: HPDF_Font; const text: HPDF_PCHAR; bytes: HPDF_PUINT): HPDF_UCS4;
         {$IFDEF Linux}cdecl{$ELSE}stdcall{$ENDIF} external LIBHPDF_DLL;


function HPDF_Font_SetReliefFont  (font: HPDF_Font; relief_font: HPDF_Font): HPDF_STATUS;
         {$IFDEF Linux}cdecl{$ELSE}stdcall{$ENDIF} external LIBHPDF_DLL;


function HPDF_AttachFile (pdf: HPDF_Doc; const filename: HPDF_PCHAR): HPDF_UINT;
         {$IFDEF Linux}cdecl{$ELSE}stdcall{$ENDIF} external LIBHPDF_DLL;


function HPDF_CreateExtGState  (pdf: HPDF_Doc) : HPDF_ExtGState;
         {$IFDEF Linux}cdecl{$ELSE}stdcall{$ENDIF} external LIBHPDF_DLL;


function HPDF_ExtGState_SetAlphaStroke  (ext_gstate: HPDF_ExtGState;
         value: HPDF_REAL) : HPDF_STATUS; {$IFDEF Linux}cdecl{$ELSE}stdcall{$ENDIF} external LIBHPDF_DLL;


function HPDF_ExtGState_SetAlphaFill  (ext_gstate: HPDF_ExtGState;
         value: HPDF_REAL) : HPDF_STATUS; {$IFDEF Linux}cdecl{$ELSE}stdcall{$ENDIF} external LIBHPDF_DLL;


function HPDF_ExtGState_SetBlendMode  (ext_gstate: HPDF_ExtGState;
         mode: THPDF_BlendMode) : HPDF_STATUS; {$IFDEF Linux}cdecl{$ELSE}stdcall{$ENDIF} external LIBHPDF_DLL;


function HPDF_Page_TextWidth (page: HPDF_Page; const text: HPDF_PCHAR): HPDF_REAL;
         {$IFDEF Linux}cdecl{$ELSE}stdcall{$ENDIF} external LIBHPDF_DLL;


function HPDF_Page_MeasureText (page: HPDF_Page; const text: HPDF_PCHAR;
        width: HPDF_REAL; options: HPDF_INT; real_width: HPDF_PREAL): HPDF_UINT;
         {$IFDEF Linux}cdecl{$ELSE}stdcall{$ENDIF} external LIBHPDF_DLL;


function HPDF_Page_MeasureTextLines (page: HPDF_Page; const text: HPDF_PCHAR; line_width: HPDF_REAL;
        options: HPDF_INT; width: THPDF_TextLineWidth; max_lines: HPDF_UINT): HPDF_UINT;
         {$IFDEF Linux}cdecl{$ELSE}stdcall{$ENDIF} external LIBHPDF_DLL;


function HPDF_Page_GetWidth (page: HPDF_Page): HPDF_REAL;
         {$IFDEF Linux}cdecl{$ELSE}stdcall{$ENDIF} external LIBHPDF_DLL;


function HPDF_Page_GetHeight (page: HPDF_Page): HPDF_REAL;
         {$IFDEF Linux}cdecl{$ELSE}stdcall{$ENDIF} external LIBHPDF_DLL;


function HPDF_Page_GetGMode (page: HPDF_Page): HPDF_UINT16;
         {$IFDEF Linux}cdecl{$ELSE}stdcall{$ENDIF} external LIBHPDF_DLL;


function HPDF_Page_GetCurrentPos (page: HPDF_Page): THPDF_Point;


function HPDF_Page_GetCurrentPos2 (page: HPDF_Page; pos: PHPDF_Point): HPDF_STATUS;
         {$IFDEF Linux}cdecl{$ELSE}stdcall{$ENDIF} external LIBHPDF_DLL;


function HPDF_Page_GetCurrentTextPos (page: HPDF_Page): THPDF_Point;


function HPDF_Page_GetCurrentTextPos2 (page: HPDF_Page; pos: PHPDF_Point): HPDF_STATUS;
         {$IFDEF Linux}cdecl{$ELSE}stdcall{$ENDIF} external LIBHPDF_DLL;


function HPDF_Page_GetCurrentFont (page: HPDF_Page): HPDF_Font;
         {$IFDEF Linux}cdecl{$ELSE}stdcall{$ENDIF} external LIBHPDF_DLL;


function HPDF_Page_GetCurrentFontSize (page: HPDF_Page): HPDF_REAL;
         {$IFDEF Linux}cdecl{$ELSE}stdcall{$ENDIF} external LIBHPDF_DLL;


function HPDF_Page_GetTransMatrix (page: HPDF_Page): THPDF_TransMatrix;
         {$IFDEF Linux}cdecl{$ELSE}stdcall{$ENDIF} external LIBHPDF_DLL;


function HPDF_Page_GetLineWidth (page: HPDF_Page): HPDF_REAL;
         {$IFDEF Linux}cdecl{$ELSE}stdcall{$ENDIF} external LIBHPDF_DLL;


function HPDF_Page_GetLineCap (page: HPDF_Page): THPDF_LineCap;
         {$IFDEF Linux}cdecl{$ELSE}stdcall{$ENDIF} external LIBHPDF_DLL;


function HPDF_Page_GetLineJoin (page: HPDF_Page): THPDF_LineJoin;
         {$IFDEF Linux}cdecl{$ELSE}stdcall{$ENDIF} external LIBHPDF_DLL;


function HPDF_Page_GetMiterLimit (page: HPDF_Page): HPDF_REAL;
         {$IFDEF Linux}cdecl{$ELSE}stdcall{$ENDIF} external LIBHPDF_DLL;


function HPDF_Page_GetDash (page: HPDF_Page): THPDF_DashMode;
         {$IFDEF Linux}cdecl{$ELSE}stdcall{$ENDIF} external LIBHPDF_DLL;


function HPDF_Page_GetFlat (page: HPDF_Page): HPDF_REAL;
         {$IFDEF Linux}cdecl{$ELSE}stdcall{$ENDIF} external LIBHPDF_DLL;


function HPDF_Page_GetCharSpace (page: HPDF_Page): HPDF_REAL;
         {$IFDEF Linux}cdecl{$ELSE}stdcall{$ENDIF} external LIBHPDF_DLL;


function HPDF_Page_GetWordSpace (page: HPDF_Page): HPDF_REAL;
         {$IFDEF Linux}cdecl{$ELSE}stdcall{$ENDIF} external LIBHPDF_DLL;


function HPDF_Page_GetHorizontalScalling (page: HPDF_Page): HPDF_REAL;
         {$IFDEF Linux}cdecl{$ELSE}stdcall{$ENDIF} external LIBHPDF_DLL;


function HPDF_Page_GetTextLeading (page: HPDF_Page): HPDF_REAL;
         {$IFDEF Linux}cdecl{$ELSE}stdcall{$ENDIF} external LIBHPDF_DLL;


function HPDF_Page_GetTextRenderingMode (page: HPDF_Page): THPDF_TextRenderingMode;
         {$IFDEF Linux}cdecl{$ELSE}stdcall{$ENDIF} external LIBHPDF_DLL;


function HPDF_Page_GetTextRise (page: HPDF_Page): HPDF_REAL;
         {$IFDEF Linux}cdecl{$ELSE}stdcall{$ENDIF} external LIBHPDF_DLL;


function HPDF_Page_GetRGBFill (page: HPDF_Page): THPDF_RGBColor;
         {$IFDEF Linux}cdecl{$ELSE}stdcall{$ENDIF} external LIBHPDF_DLL;


function HPDF_Page_GetRGBStroke (page: HPDF_Page): THPDF_RGBColor;
         {$IFDEF Linux}cdecl{$ELSE}stdcall{$ENDIF} external LIBHPDF_DLL;


function HPDF_Page_GetCMYKFill (page: HPDF_Page): THPDF_CMYKColor;
         {$IFDEF Linux}cdecl{$ELSE}stdcall{$ENDIF} external LIBHPDF_DLL;


function HPDF_Page_GetCMYKStroke (page: HPDF_Page): THPDF_CMYKColor;
         {$IFDEF Linux}cdecl{$ELSE}stdcall{$ENDIF} external LIBHPDF_DLL;


function HPDF_Page_GetGrayFill (page: HPDF_Page): HPDF_REAL;
         {$IFDEF Linux}cdecl{$ELSE}stdcall{$ENDIF} external LIBHPDF_DLL;


function HPDF_Page_GetGrayStroke (page: HPDF_Page): HPDF_REAL;
         {$IFDEF Linux}cdecl{$ELSE}stdcall{$ENDIF} external LIBHPDF_DLL;


function HPDF_Page_GetStrokingColorSpace (page: HPDF_Page): THPDF_ColorSpace;
         {$IFDEF Linux}cdecl{$ELSE}stdcall{$ENDIF} external LIBHPDF_DLL;


function HPDF_Page_GetFillingColorSpace (page: HPDF_Page): THPDF_ColorSpace;
         {$IFDEF Linux}cdecl{$ELSE}stdcall{$ENDIF} external LIBHPDF_DLL;


function HPDF_Page_GetTextMatrix (page: HPDF_Page): THPDF_TransMatrix;
         {$IFDEF Linux}cdecl{$ELSE}stdcall{$ENDIF} external LIBHPDF_DLL;


function HPDF_Page_GetGStateDepth (page: HPDF_Page): HPDF_UINT;
         {$IFDEF Linux}cdecl{$ELSE}stdcall{$ENDIF} external LIBHPDF_DLL;


function HPDF_Page_SetLineWidth (page: HPDF_Page; line_width: HPDF_REAL):
        HPDF_STATUS; {$IFDEF Linux}cdecl{$ELSE}stdcall{$ENDIF} external LIBHPDF_DLL;


function HPDF_Page_SetLineCap (page: HPDF_Page; line_cap: THPDF_LineCap):
        HPDF_STATUS; {$IFDEF Linux}cdecl{$ELSE}stdcall{$ENDIF} external LIBHPDF_DLL;


function HPDF_Page_SetLineJoin (page: HPDF_Page; line_join: THPDF_LineJoin):
        HPDF_STATUS; {$IFDEF Linux}cdecl{$ELSE}stdcall{$ENDIF} external LIBHPDF_DLL;


function HPDF_Page_SetMiterLimit (page: HPDF_Page; miter_limit: HPDF_REAL):
        HPDF_STATUS; {$IFDEF Linux}cdecl{$ELSE}stdcall{$ENDIF} external LIBHPDF_DLL;


function HPDF_Page_SetDash (page: HPDF_Page; ptn: HPDF_PUINT16; num_param: HPDF_UINT;
        phase: HPDF_UINT): HPDF_STATUS;
         {$IFDEF Linux}cdecl{$ELSE}stdcall{$ENDIF} external LIBHPDF_DLL;


function HPDF_Page_SetFlat (page: HPDF_Page; flatness: HPDF_REAL): HPDF_STATUS;
         {$IFDEF Linux}cdecl{$ELSE}stdcall{$ENDIF} external LIBHPDF_DLL;


function HPDF_Page_SetExtGState (page: HPDF_Page; ext_gstate: HPDF_ExtGState): HPDF_STATUS;
         {$IFDEF Linux}cdecl{$ELSE}stdcall{$ENDIF} external LIBHPDF_DLL;


function HPDF_Page_GSave (page: HPDF_Page): HPDF_STATUS;
         {$IFDEF Linux}cdecl{$ELSE}stdcall{$ENDIF} external LIBHPDF_DLL;


function HPDF_Page_GRestore (page: HPDF_Page): HPDF_STATUS;
         {$IFDEF Linux}cdecl{$ELSE}stdcall{$ENDIF} external LIBHPDF_DLL;


function HPDF_Page_Concat (page: HPDF_Page; a: HPDF_REAL; b: HPDF_REAL; c: HPDF_REAL;
        d: HPDF_REAL; x: HPDF_REAL; y: HPDF_REAL): HPDF_STATUS;
         {$IFDEF Linux}cdecl{$ELSE}stdcall{$ENDIF} external LIBHPDF_DLL;


function HPDF_Page_MoveTo (page: HPDF_Page; x: HPDF_REAL; y: HPDF_REAL): HPDF_STATUS;
         {$IFDEF Linux}cdecl{$ELSE}stdcall{$ENDIF} external LIBHPDF_DLL;


function HPDF_Page_LineTo (page: HPDF_Page; x: HPDF_REAL; y: HPDF_REAL): HPDF_STATUS;
         {$IFDEF Linux}cdecl{$ELSE}stdcall{$ENDIF} external LIBHPDF_DLL;


function HPDF_Page_CurveTo (page: HPDF_Page; x1: HPDF_REAL; y1: HPDF_REAL;
        x2: HPDF_REAL; y2: HPDF_REAL; x3: HPDF_REAL; y3: HPDF_REAL): HPDF_STATUS;
         {$IFDEF Linux}cdecl{$ELSE}stdcall{$ENDIF} external LIBHPDF_DLL;


function HPDF_Page_CurveTo2 (page: HPDF_Page; x2: HPDF_REAL; y2: HPDF_REAL;
        x3: HPDF_REAL; y3: HPDF_REAL): HPDF_STATUS; {$IFDEF Linux}cdecl{$ELSE}stdcall{$ENDIF} external LIBHPDF_DLL;


function HPDF_Page_CurveTo3 (page: HPDF_Page; x1: HPDF_REAL; y1: HPDF_REAL;
        x3: HPDF_REAL; y3: HPDF_REAL): HPDF_STATUS; {$IFDEF Linux}cdecl{$ELSE}stdcall{$ENDIF} external LIBHPDF_DLL;


function HPDF_Page_ClosePath (page: HPDF_Page): HPDF_STATUS;
         {$IFDEF Linux}cdecl{$ELSE}stdcall{$ENDIF} external LIBHPDF_DLL;


function HPDF_Page_Rectangle (page: HPDF_Page; x: HPDF_REAL; y: HPDF_REAL;
        width: HPDF_REAL; height: HPDF_REAL): HPDF_STATUS;
         {$IFDEF Linux}cdecl{$ELSE}stdcall{$ENDIF} external LIBHPDF_DLL;


function HPDF_Page_Stroke (page: HPDF_Page): HPDF_STATUS;
         {$IFDEF Linux}cdecl{$ELSE}stdcall{$ENDIF} external LIBHPDF_DLL;


function HPDF_Page_ClosePathStroke (page: HPDF_Page): HPDF_STATUS;
         {$IFDEF Linux}cdecl{$ELSE}stdcall{$ENDIF} external LIBHPDF_DLL;


function HPDF_Page_Fill (page: HPDF_Page): HPDF_STATUS;
         {$IFDEF Linux}cdecl{$ELSE}stdcall{$ENDIF} external LIBHPDF_DLL;


function HPDF_Page_Eofill (page: HPDF_Page): HPDF_STATUS;
         {$IFDEF Linux}cdecl{$ELSE}stdcall{$ENDIF} external LIBHPDF_DLL;


function HPDF_Page_FillStroke (page: HPDF_Page): HPDF_STATUS;
         {$IFDEF Linux}cdecl{$ELSE}stdcall{$ENDIF} external LIBHPDF_DLL;


function HPDF_Page_EofillStroke (page: HPDF_Page): HPDF_STATUS;
         {$IFDEF Linux}cdecl{$ELSE}stdcall{$ENDIF} external LIBHPDF_DLL;


function HPDF_Page_ClosePathFillStroke (page: HPDF_Page): HPDF_STATUS;
         {$IFDEF Linux}cdecl{$ELSE}stdcall{$ENDIF} external LIBHPDF_DLL;


function HPDF_Page_ClosePathEofillStroke (page: HPDF_Page): HPDF_STATUS;
         {$IFDEF Linux}cdecl{$ELSE}stdcall{$ENDIF} external LIBHPDF_DLL;


function HPDF_Page_EndPath (page: HPDF_Page): HPDF_STATUS;
         {$IFDEF Linux}cdecl{$ELSE}stdcall{$ENDIF} external LIBHPDF_DLL;


function HPDF_Page_Clip (page: HPDF_Page): HPDF_STATUS;
         {$IFDEF Linux}cdecl{$ELSE}stdcall{$ENDIF} external LIBHPDF_DLL;


function HPDF_Page_Eoclip (page: HPDF_Page): HPDF_STATUS;
         {$IFDEF Linux}cdecl{$ELSE}stdcall{$ENDIF} external LIBHPDF_DLL;


function HPDF_Page_BeginText (page: HPDF_Page): HPDF_STATUS;
         {$IFDEF Linux}cdecl{$ELSE}stdcall{$ENDIF} external LIBHPDF_DLL;


function HPDF_Page_EndText (page: HPDF_Page): HPDF_STATUS;
         {$IFDEF Linux}cdecl{$ELSE}stdcall{$ENDIF} external LIBHPDF_DLL;


function HPDF_Page_SetCharSpace (page: HPDF_Page; value: HPDF_REAL): HPDF_STATUS;
         {$IFDEF Linux}cdecl{$ELSE}stdcall{$ENDIF} external LIBHPDF_DLL;


function HPDF_Page_SetWordSpace (page: HPDF_Page; value: HPDF_REAL): HPDF_STATUS;
         {$IFDEF Linux}cdecl{$ELSE}stdcall{$ENDIF} external LIBHPDF_DLL;


function HPDF_Page_SetHorizontalScalling (page: HPDF_Page; value: HPDF_REAL):
        HPDF_STATUS; {$IFDEF Linux}cdecl{$ELSE}stdcall{$ENDIF} external LIBHPDF_DLL;


function HPDF_Page_SetTextLeading (page: HPDF_Page; value: HPDF_REAL): HPDF_STATUS;
         {$IFDEF Linux}cdecl{$ELSE}stdcall{$ENDIF} external LIBHPDF_DLL;


function HPDF_Page_SetFontAndSize (page: HPDF_Page; font: HPDF_Font;
        size: HPDF_REAL): HPDF_STATUS; {$IFDEF Linux}cdecl{$ELSE}stdcall{$ENDIF} external LIBHPDF_DLL;


function HPDF_Page_SetTextRenderingMode (page: HPDF_Page;
        mode: THPDF_TextRenderingMode): HPDF_STATUS; {$IFDEF Linux}cdecl{$ELSE}stdcall{$ENDIF} external LIBHPDF_DLL;


function HPDF_Page_SetTextRise (page: HPDF_Page; value: HPDF_REAL): HPDF_STATUS;
         {$IFDEF Linux}cdecl{$ELSE}stdcall{$ENDIF} external LIBHPDF_DLL;


function HPDF_Page_MoveTextPos (page: HPDF_Page; x: HPDF_REAL; y: HPDF_REAL):
        HPDF_STATUS; {$IFDEF Linux}cdecl{$ELSE}stdcall{$ENDIF} external LIBHPDF_DLL;


function HPDF_Page_MoveTextPos2 (page: HPDF_Page; x: HPDF_REAL; y: HPDF_REAL):
        HPDF_STATUS; {$IFDEF Linux}cdecl{$ELSE}stdcall{$ENDIF} external LIBHPDF_DLL;


function HPDF_Page_SetTextMatrix (page: HPDF_Page; a: HPDF_REAL; b: HPDF_REAL; 
        c: HPDF_REAL; d: HPDF_REAL; x: HPDF_REAL; y: HPDF_REAL):
        HPDF_STATUS; {$IFDEF Linux}cdecl{$ELSE}stdcall{$ENDIF} external LIBHPDF_DLL;


function HPDF_Page_MoveToNextLine (page: HPDF_Page): HPDF_STATUS;
         {$IFDEF Linux}cdecl{$ELSE}stdcall{$ENDIF} external LIBHPDF_DLL;


function HPDF_Page_ShowText (page: HPDF_Page; const text: HPDF_PCHAR): HPDF_STATUS;
         {$IFDEF Linux}cdecl{$ELSE}stdcall{$ENDIF} external LIBHPDF_DLL;


function HPDF_Page_ShowTextNextLine (page: HPDF_Page; const text: HPDF_PCHAR):
        HPDF_STATUS; {$IFDEF Linux}cdecl{$ELSE}stdcall{$ENDIF} external LIBHPDF_DLL;


function HPDF_Page_ShowTextNextLineEx (page: HPDF_Page; word_space: HPDF_REAL;
        char_space: HPDF_REAL; const text: HPDF_PCHAR): HPDF_STATUS;
         {$IFDEF Linux}cdecl{$ELSE}stdcall{$ENDIF} external LIBHPDF_DLL;


function HPDF_Page_SetGrayFill (page: HPDF_Page; gray: HPDF_REAL): HPDF_STATUS;
         {$IFDEF Linux}cdecl{$ELSE}stdcall{$ENDIF} external LIBHPDF_DLL;


function HPDF_Page_SetGrayStroke (page: HPDF_Page; gray: HPDF_REAL): HPDF_STATUS;
         {$IFDEF Linux}cdecl{$ELSE}stdcall{$ENDIF} external LIBHPDF_DLL;


function HPDF_Page_SetRGBFill (page: HPDF_Page; r: HPDF_REAL; g: HPDF_REAL;
        b: HPDF_REAL): HPDF_STATUS; {$IFDEF Linux}cdecl{$ELSE}stdcall{$ENDIF} external LIBHPDF_DLL;


function HPDF_Page_SetRGBStroke (page: HPDF_Page; r: HPDF_REAL; g: HPDF_REAL;
        b: HPDF_REAL): HPDF_STATUS; {$IFDEF Linux}cdecl{$ELSE}stdcall{$ENDIF} external LIBHPDF_DLL;


function HPDF_Page_SetCMYKFill (page: HPDF_Page; c: HPDF_REAL; m: HPDF_REAL;
        y: HPDF_REAL; k: HPDF_REAL): HPDF_STATUS; {$IFDEF Linux}cdecl{$ELSE}stdcall{$ENDIF} external LIBHPDF_DLL;


function HPDF_Page_SetCMYKStroke (page: HPDF_Page; c: HPDF_REAL; m: HPDF_REAL;
        y: HPDF_REAL; k: HPDF_REAL): HPDF_STATUS; {$IFDEF Linux}cdecl{$ELSE}stdcall{$ENDIF} external LIBHPDF_DLL;


function HPDF_Page_ExecuteXObject (page: HPDF_Page; obj: HPDF_XObject): HPDF_STATUS;
         {$IFDEF Linux}cdecl{$ELSE}stdcall{$ENDIF} external LIBHPDF_DLL;


function HPDF_Page_New_Content_Stream (page: HPDF_Page; new_stream: HPDF_Dict): HPDF_STATUS;
         {$IFDEF Linux}cdecl{$ELSE}stdcall{$ENDIF} external LIBHPDF_DLL;


function HPDF_Page_Insert_Shared_Content_Stream (page: HPDF_Page; shared_stream: HPDF_Dict): HPDF_STATUS;
         {$IFDEF Linux}cdecl{$ELSE}stdcall{$ENDIF} external LIBHPDF_DLL;


function HPDF_Page_DrawImage (page: HPDF_Page; image: HPDF_Image; x: HPDF_REAL;
        y: HPDF_REAL; width: HPDF_REAL; height: HPDF_REAL): HPDF_STATUS;
         {$IFDEF Linux}cdecl{$ELSE}stdcall{$ENDIF} external LIBHPDF_DLL;


function HPDF_Page_Circle (page: HPDF_Page; x: HPDF_REAL; y: HPDF_REAL;
        ray: HPDF_REAL): HPDF_STATUS; {$IFDEF Linux}cdecl{$ELSE}stdcall{$ENDIF} external LIBHPDF_DLL;


function HPDF_Page_Ellipse (page: HPDF_Page; x: HPDF_REAL; y: HPDF_REAL;
        xray: HPDF_REAL; yray: HPDF_REAL): HPDF_STATUS; {$IFDEF Linux}cdecl{$ELSE}stdcall{$ENDIF} external LIBHPDF_DLL;


function HPDF_Page_Arc (page: HPDF_Page; x: HPDF_REAL; y: HPDF_REAL; ray: HPDF_REAL;
        ang1: HPDF_REAL; ang2: HPDF_REAL): HPDF_STATUS; {$IFDEF Linux}cdecl{$ELSE}stdcall{$ENDIF} external LIBHPDF_DLL;


function HPDF_Page_TextOut (page: HPDF_Page; xpos: HPDF_REAL; ypos: HPDF_REAL;
         const text: HPDF_PCHAR): HPDF_STATUS; {$IFDEF Linux}cdecl{$ELSE}stdcall{$ENDIF} external LIBHPDF_DLL;


function HPDF_Page_TextRect  (page: HPDF_Page; left: HPDF_REAL; top: HPDF_REAL;
        right: HPDF_REAL; bottom: HPDF_REAL; const text: HPDF_PCHAR; 
        align: THPDF_TextAlignment; len: HPDF_PUINT): HPDF_STATUS;
         {$IFDEF Linux}cdecl{$ELSE}stdcall{$ENDIF} external LIBHPDF_DLL;


function HPDF_Page_SetJustifyRatio (page: HPDF_Page; word_space: HPDF_REAL; char_space: HPDF_REAL;
        kashida: HPDF_REAL): HPDF_STATUS; {$IFDEF Linux}cdecl{$ELSE}stdcall{$ENDIF} external LIBHPDF_DLL;


function HPDF_Page_InterlinearAnnotationRatio (page: HPDF_Page; ratio: HPDF_REAL): HPDF_STATUS;
         {$IFDEF Linux}cdecl{$ELSE}stdcall{$ENDIF} external LIBHPDF_DLL;


function HPDF_Page_SetSlideShow  (page: HPDF_Page; sstype: THPDF_TransitionStyle; 
        disp_time: HPDF_REAL; trans_time: HPDF_REAL): HPDF_STATUS; 
         {$IFDEF Linux}cdecl{$ELSE}stdcall{$ENDIF} external LIBHPDF_DLL;


function HPDF_ICC_LoadIccFromMem (pdf: HPDF_Doc; mmgr: HPDF_MMgr; iccdata: HPDF_Stream; xref: HPDF_Xref;
        numcomponent: Integer): HPDF_OutputIntent; {$IFDEF Linux}cdecl{$ELSE}stdcall{$ENDIF} external LIBHPDF_DLL;


function HPDF_LoadIccProfileFromFile (pdf: HPDF_Doc; icc_file_name: HPDF_PCHAR;
  numcomponent: Integer): HPDF_OutputIntent; {$IFDEF Linux}cdecl{$ELSE}stdcall{$ENDIF} external LIBHPDF_DLL;


function HPDF_PDFA_AppendOutputIntents (pdf: HPDF_Doc; const iccname: HPDF_PCHAR;
        iccdict: HPDF_Dict): HPDF_STATUS; {$IFDEF Linux}cdecl{$ELSE}stdcall{$ENDIF} external LIBHPDF_DLL;


function HPDF_PDFA_SetPDFAConformance (pdf: HPDF_Doc; pdfatype: THPDF_PDFA_TYPE):
        HPDF_STATUS; {$IFDEF Linux}cdecl{$ELSE}stdcall{$ENDIF} external LIBHPDF_DLL;


function HPDF_CreateJavaScript (pdf: HPDF_Doc; const code: HPDF_PCHAR):
        HPDF_JavaScript; {$IFDEF Linux}cdecl{$ELSE}stdcall{$ENDIF} external LIBHPDF_DLL;


function HPDF_LoadJSFromFile (pdf: HPDF_Doc; const filename: HPDF_PCHAR):
        HPDF_JavaScript; {$IFDEF Linux}cdecl{$ELSE}stdcall{$ENDIF} external LIBHPDF_DLL;


function HPDF_Create3DView (mmgr: HPDF_MMgr; const name: HPDF_PCHAR):
        HPDF_Dict; {$IFDEF Linux}cdecl{$ELSE}stdcall{$ENDIF} external LIBHPDF_DLL;


function HPDF_GetU3DMMgr (u3d: HPDF_U3D): HPDF_MMgr; {$IFDEF Linux}cdecl{$ELSE}stdcall{$ENDIF} external LIBHPDF_DLL;


function HPDF_U3D_Add3DView (u3d: HPDF_U3D; view: HPDF_Dict):
        HPDF_STATUS; {$IFDEF Linux}cdecl{$ELSE}stdcall{$ENDIF} external LIBHPDF_DLL;


function HPDF_U3D_SetDefault3DView (u3d: HPDF_U3D; const name: HPDF_PCHAR):
        HPDF_STATUS; {$IFDEF Linux}cdecl{$ELSE}stdcall{$ENDIF} external LIBHPDF_DLL;


function HPDF_U3D_AddOnInstanciate (u3d: HPDF_U3D; javaScript: HPDF_JavaScript):
        HPDF_STATUS; {$IFDEF Linux}cdecl{$ELSE}stdcall{$ENDIF} external LIBHPDF_DLL;


function HPDF_3DView_CreateNode (view: HPDF_Dict; const name: HPDF_PCHAR):
        HPDF_Dict; {$IFDEF Linux}cdecl{$ELSE}stdcall{$ENDIF} external LIBHPDF_DLL;


function HPDF_3DViewNode_SetOpacity (node: HPDF_Dict; opacity: HPDF_REAL):
        HPDF_STATUS; {$IFDEF Linux}cdecl{$ELSE}stdcall{$ENDIF} external LIBHPDF_DLL;


function HPDF_3DViewNode_SetVisibility (node: HPDF_Dict; visible: HPDF_BOOL):
        HPDF_STATUS; {$IFDEF Linux}cdecl{$ELSE}stdcall{$ENDIF} external LIBHPDF_DLL;


function HPDF_3DViewNode_SetMatrix (node: HPDF_Dict; Mat3D: THPDF_3DMatrix):
        HPDF_STATUS; {$IFDEF Linux}cdecl{$ELSE}stdcall{$ENDIF} external LIBHPDF_DLL;


function HPDF_3DView_AddNode (view: HPDF_Dict; node: HPDF_Dict):
        HPDF_STATUS; {$IFDEF Linux}cdecl{$ELSE}stdcall{$ENDIF} external LIBHPDF_DLL;


function HPDF_3DView_SetLighting (view: HPDF_Dict; const scheme: HPDF_PCHAR):
        HPDF_STATUS; {$IFDEF Linux}cdecl{$ELSE}stdcall{$ENDIF} external LIBHPDF_DLL;


function HPDF_3DView_SetBackgroundColor (view: HPDF_Dict; r: HPDF_REAL; g: HPDF_REAL; b: HPDF_REAL):
        HPDF_STATUS; {$IFDEF Linux}cdecl{$ELSE}stdcall{$ENDIF} external LIBHPDF_DLL;


function HPDF_3DView_SetPerspectiveProjection (view: HPDF_Dict; fov: HPDF_REAL):
        HPDF_STATUS; {$IFDEF Linux}cdecl{$ELSE}stdcall{$ENDIF} external LIBHPDF_DLL;


function HPDF_3DView_SetOrthogonalProjection (view: HPDF_Dict; mag: HPDF_REAL):
        HPDF_STATUS; {$IFDEF Linux}cdecl{$ELSE}stdcall{$ENDIF} external LIBHPDF_DLL;


function HPDF_3DView_SetCamera (view: HPDF_Dict; coox: HPDF_REAL; cooy: HPDF_REAL; cooz: HPDF_REAL;
        c2cx: HPDF_REAL; c2cy: HPDF_REAL; c2cz: HPDF_REAL; roo: HPDF_REAL; roll: HPDF_REAL):
        HPDF_STATUS; {$IFDEF Linux}cdecl{$ELSE}stdcall{$ENDIF} external LIBHPDF_DLL;


function HPDF_3DView_SetCameraByMatrix (view: HPDF_Dict; Mat3D: THPDF_3DMatrix; co: HPDF_REAL):
        HPDF_STATUS; {$IFDEF Linux}cdecl{$ELSE}stdcall{$ENDIF} external LIBHPDF_DLL;


function HPDF_3DView_SetCrossSectionOn (view: HPDF_Dict; center: THPDF_Point3D; Roll: HPDF_REAL;
        Pitch: HPDF_REAL; opacity: HPDF_REAL; showintersection: HPDF_BOOL):
        HPDF_STATUS; {$IFDEF Linux}cdecl{$ELSE}stdcall{$ENDIF} external LIBHPDF_DLL;


function HPDF_3DView_SetCrossSectionOff (view: HPDF_Dict): HPDF_STATUS;
        {$IFDEF Linux}cdecl{$ELSE}stdcall{$ENDIF} external LIBHPDF_DLL;


implementation

function HPDF_Page_GetCurrentPos (page: HPDF_Page): THPDF_Point;
var
  pos: THPDF_Point;
begin
  HPDF_Page_GetCurrentPos2 (page, @pos);
  result := pos;
end;

function HPDF_Page_GetCurrentTextPos (page: HPDF_Page): THPDF_Point;
var
  pos: THPDF_Point;
begin
  HPDF_Page_GetCurrentTextPos2 (page, @pos);
  result := pos;
end;

function HPDF_Image_GetSize (image: HPDF_Image): THPDF_Point;
var
  size: THPDF_Point;
begin
  HPDF_Image_GetSize2 (image, @size);
  result := size;
end;


end.

