{
  ament-cmake,
  buildAmentCmakePackage,
  fetchgit,
  fetchurl,
  fetchzip,
  mkSourceSet,
  rosSystemPackages,
  rosidl-default-generators,
  rosidl-default-runtime,
  std-msgs,
  substituteSource,
}:
buildAmentCmakePackage (finalAttrs: {
  pname = "novatel_oem7_msgs";
  version = "24.0.0-1";
  src = finalAttrs.passthru.sources."novatel_oem7_msgs";
  nativeBuildInputs = [ ament-cmake rosidl-default-generators ];
  propagatedBuildInputs = [ rosidl-default-runtime std-msgs ];
  passthru.sources = mkSourceSet (sources: {
    "novatel_oem7_msgs" = substituteSource {
      src = fetchgit {
        name = "novatel_oem7_msgs-source";
        url = "https://github.com/novatel-gbp/novatel_oem7_driver-release.git";
        rev = "d28dd553946edecc8c66822e642c4715c046f7ec";
        hash = "sha256-2bXG7gbt64q+Dn/wbQCsrQUMHmnx1Lfqm5W2Zbgetic=";
      };
    };
  });
  meta = {
    description = "Messages for NovAtel Oem7 family of receivers.";
  };
})
