{
  ament-cmake,
  buildAmentCmakePackage,
  etsi-its-coding,
  etsi-its-conversion,
  etsi-its-msgs,
  etsi-its-msgs-utils,
  fetchgit,
  fetchurl,
  fetchzip,
  mkSourceSet,
  ros-environment,
  rosSystemPackages,
  substituteSource,
}:
buildAmentCmakePackage (finalAttrs: {
  pname = "etsi_its_messages";
  version = "3.2.0-1";
  src = finalAttrs.passthru.sources."etsi_its_messages";
  nativeBuildInputs = [ ament-cmake ];
  propagatedNativeBuildInputs = [ ros-environment ];
  propagatedBuildInputs = [ etsi-its-coding etsi-its-conversion etsi-its-msgs etsi-its-msgs-utils ];
  passthru.sources = mkSourceSet (sources: {
    "etsi_its_messages" = substituteSource {
      src = fetchgit {
        name = "etsi_its_messages-source";
        url = "https://github.com/ros2-gbp/etsi_its_messages-release.git";
        rev = "6d8c6e40048dd3c08a4388e55ed127ad082bbb29";
        hash = "sha256-Bz3gnj5KClSMViQ7MgxxWqiX94sBSIWp42CdrSU2NFE=";
      };
    };
  });
  meta = {
    description = "ROS support for ETSI ITS messages";
  };
})
