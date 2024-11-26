{
  ament-cmake,
  buildAmentCmakePackage,
  fetchgit,
  fetchurl,
  fetchzip,
  mkSourceSet,
  rosSystemPackages,
  smach,
  smach-msgs,
  smach-ros,
  substituteSource,
}:
buildAmentCmakePackage (finalAttrs: {
  pname = "executive_smach";
  version = "3.0.3-3";
  src = finalAttrs.passthru.sources."executive_smach";
  nativeBuildInputs = [ ament-cmake ];
  propagatedBuildInputs = [ smach smach-msgs smach-ros ];
  passthru.sources = mkSourceSet (sources: {
    "executive_smach" = substituteSource {
      src = fetchgit {
        name = "executive_smach-source";
        url = "https://github.com/ros2-gbp/executive_smach-release.git";
        rev = "01a5cca0e387bee47acbf617134ea0e851c7d993";
        hash = "sha256-68w8XZNadjLJdkgr+OVVW8Stg9rqS5wqQgYUxlZtOo0=";
      };
    };
  });
  meta = {
    description = "This metapackage depends on the SMACH library and ROS SMACH integration packages.";
  };
})
