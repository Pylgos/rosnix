{
  ament-cmake,
  buildAmentCmakePackage,
  cv-bridge,
  fetchgit,
  fetchurl,
  fetchzip,
  mkSourceSet,
  rosSystemPackages,
  substituteSource,
}:
buildAmentCmakePackage (finalAttrs: {
  pname = "aruco";
  version = "5.0.5-2";
  src = finalAttrs.passthru.sources."aruco";
  nativeBuildInputs = [ ament-cmake ];
  propagatedNativeBuildInputs = [ cv-bridge ] ++ rosSystemPackages.getPackages { forNativeBuildInputs = [ "eigen" ]; };
  buildInputs = [ ament-cmake ];
  propagatedBuildInputs = [ cv-bridge ] ++ rosSystemPackages.getPackages { forBuildInputs = [ "eigen" ]; };
  passthru.sources = mkSourceSet (sources: {
    "aruco" = substituteSource {
      src = fetchgit {
        name = "aruco-source";
        url = "https://github.com/ros2-gbp/aruco_ros-release.git";
        rev = "976d1e693515f2a8ae67bf91d5dfa7c8ca83ebe4";
        hash = "sha256-3Foblmp2VasqOKhDmgA7heDxnleqT6Pqnk7dXajdiE4=";
      };
    };
  });
  meta = {
    description = "\n    The ARUCO Library has been developed by the Ava group of the Univeristy of Cordoba(Spain).\n    It provides real-time marker based 3D pose estimation using AR markers.\n  ";
  };
})
