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
  version = "2.0.1-1";
  src = finalAttrs.passthru.sources."trac_ik";
  nativeBuildInputs = [ ament-cmake wrapRosQtAppsHook ];
  propagatedBuildInputs = [ trac-ik-kinematics-plugin trac-ik-lib ];
  passthru.sources = mkSourceSet (sources: {
    "trac_ik" = substituteSource {
      src = fetchgit {
        name = "trac_ik-source";
        url = "https://github.com/ros2-gbp/trac_ik-release.git";
        rev = "92b5f9f982498bed253e7fe0aaccabb177014abb";
        hash = "sha256-Mi5zU70nYLOrjdiVRLXtTefB9IBLrHv8HpqzxWWRWas=";
      };
    };
  });
  meta = {
    description = "The ROS packages in this repository were created to provide an improved alternative Inverse Kinematics solver to the popular inverse Jacobian methods in KDL. TRAC-IK handles joint-limited chains better than KDL without increasing solve time.";
  };
})
