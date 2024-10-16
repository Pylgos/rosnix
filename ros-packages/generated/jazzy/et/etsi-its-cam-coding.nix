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
    "etsi_its_cam_coding" = substituteSource {
      src = fetchgit {
        name = "etsi_its_cam_coding-source";
        url = "https://github.com/ros2-gbp/etsi_its_messages-release.git";
        rev = "3f674033bb0a8b567edd8aec5091fd215a679d57";
        hash = "sha256-1KITntL+FLIgb4ALY8L1R6r7U8WeEol/zrw9uFE7hOs=";
      };
      substitutions = [
      ];
    };
  });
in
buildAmentCmakePackage (finalAttrs: {
  pname = "etsi_its_cam_coding";
  version = "2.3.0-1";
  src = finalAttrs.passthru.sources."etsi_its_cam_coding";
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
    description = "C++ compatible C source code for ETSI ITS CAMs generated from ASN.1 using asn1c";
  };
})
