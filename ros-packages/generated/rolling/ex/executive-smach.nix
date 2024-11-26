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
  version = "3.0.3-2";
  src = finalAttrs.passthru.sources."executive_smach";
  nativeBuildInputs = [ ament-cmake ];
  propagatedBuildInputs = [ smach smach-msgs smach-ros ];
  passthru.sources = mkSourceSet (sources: {
    "executive_smach" = substituteSource {
      src = fetchgit {
        name = "executive_smach-source";
        url = "https://github.com/ros2-gbp/executive_smach-release.git";
        rev = "d89d702228daab0e0f1aff6dd3c57b70cb37a998";
        hash = "sha256-68w8XZNadjLJdkgr+OVVW8Stg9rqS5wqQgYUxlZtOo0=";
      };
    };
  });
  meta = {
    description = "This metapackage depends on the SMACH library and ROS SMACH integration packages.";
  };
})
