{
  ament-cmake,
  buildAmentCmakePackage,
  fetchgit,
  fetchurl,
  fetchzip,
  mkSourceSet,
  ros-environment,
  rosSystemPackages,
  substituteSource,
}:
let
  sources = mkSourceSet (sources: {
    "etsi_its_cam_ts_coding" = substituteSource {
      src = fetchgit {
        name = "etsi_its_cam_ts_coding-source";
        url = "https://github.com/ros2-gbp/etsi_its_messages-release.git";
        rev = "f51f801162ef017eb30fedf70e0d064f8d0cca85";
        hash = "sha256-ddOHhd5/2i8iCLUzbc4NwcrePh+2Fd4pLbf9CGp3mK4=";
      };
      substitutions = [
      ];
    };
  });
in
buildAmentCmakePackage (finalAttrs: {
  pname = "etsi_its_cam_ts_coding";
  version = "2.3.0-1";
  src = finalAttrs.passthru.sources."etsi_its_cam_ts_coding";
  nativeBuildInputs = [ ament-cmake ] ++ rosSystemPackages.getPackages { forNativeBuildInputs = [  ]; };
  propagatedNativeBuildInputs = [ ros-environment ] ++ rosSystemPackages.getPackages { forNativeBuildInputs = [  ]; };
  buildInputs = [  ] ++ rosSystemPackages.getPackages { forBuildInputs = [  ]; };
  propagatedBuildInputs = [  ] ++ rosSystemPackages.getPackages { forBuildInputs = [  ]; };
  depsTargetTarget = [  ] ++ rosSystemPackages.getPackages { forDepsTargetTarget = [  ]; };
  depsTargetTargetPropagated = [  ] ++ rosSystemPackages.getPackages { forDepsTargetTarget = [  ]; };
  checkInputs = [  ] ++ rosSystemPackages.getPackages { forBuildInputs = [  ]; };
  passthru = {
    inherit sources;
  };
  meta = {
    description = "C++ compatible C source code for ETSI ITS CAMs (TS) generated from ASN.1 using asn1c";
  };
})
