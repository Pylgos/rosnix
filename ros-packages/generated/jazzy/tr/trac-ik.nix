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
  version = "2.0.2-1";
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
        rev = "d0b657c20a1bb4d8004ccaed10a6616bb1e08dad";
        hash = "sha256-GJyIUj0aRCIBvtzgase2HfdSF5fnv3TnCeWbX+9VQ+o=";
      };
    };
  });
  meta = {
    description = "\n    The ROS packages in this repository were created to provide an improved\n    alternative Inverse Kinematics solver to the popular inverse Jacobian\n    methods in KDL.  TRAC-IK handles joint-limited chains better than KDL\n    without increasing solve time.\n  ";
  };
})
