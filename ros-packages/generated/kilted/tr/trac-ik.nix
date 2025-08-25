{
  ament-cmake,
  buildAmentCmakePackage,
  fetchgit,
  fetchurl,
  fetchzip,
  mkSourceSet,
  rosSystemPackages,
  substituteSource,
  trac-ik-kinematics-plugin,
  trac-ik-lib,
  wrapRosQtAppsHook,
}:
buildAmentCmakePackage (finalAttrs: {
  pname = "trac_ik";
  version = "2.1.1-2";
  src = finalAttrs.passthru.sources."trac_ik";
  nativeBuildInputs = [ ament-cmake wrapRosQtAppsHook ];
  propagatedNativeBuildInputs = [ trac-ik-kinematics-plugin trac-ik-lib ];
  buildInputs = [ ament-cmake ];
  propagatedBuildInputs = [ trac-ik-kinematics-plugin trac-ik-lib ];
  passthru.sources = mkSourceSet (sources: {
    "trac_ik" = substituteSource {
      src = fetchgit {
        name = "trac_ik-source";
        url = "https://github.com/ros2-gbp/trac_ik-release.git";
        rev = "5a34cae95c7f6a88876f1897bdc0022ae40551d3";
        hash = "sha256-VBvVVZOulaGJYK+MFI+VzTeQUutLgsf3i/taRwh/UJA=";
      };
    };
  });
  meta = {
    description = "\n    The ROS packages in this repository were created to provide an improved\n    alternative Inverse Kinematics solver to the popular inverse Jacobian\n    methods in KDL.  TRAC-IK handles joint-limited chains better than KDL\n    without increasing solve time.\n  ";
  };
})
