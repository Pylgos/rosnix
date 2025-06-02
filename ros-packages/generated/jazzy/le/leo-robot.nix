{
  ament-cmake,
  buildAmentCmakePackage,
  fetchgit,
  fetchurl,
  fetchzip,
  leo,
  leo-bringup,
  leo-filters,
  leo-fw,
  mkSourceSet,
  rosSystemPackages,
  substituteSource,
}:
buildAmentCmakePackage (finalAttrs: {
  pname = "leo_robot";
  version = "2.3.0-1";
  src = finalAttrs.passthru.sources."leo_robot";
  nativeBuildInputs = [ ament-cmake ];
  propagatedNativeBuildInputs = [ leo leo-bringup leo-filters leo-fw ];
  buildInputs = [ ament-cmake ];
  propagatedBuildInputs = [ leo leo-bringup leo-filters leo-fw ];
  passthru.sources = mkSourceSet (sources: {
    "leo_robot" = substituteSource {
      src = fetchgit {
        name = "leo_robot-source";
        url = "https://github.com/ros2-gbp/leo_robot-release.git";
        rev = "efe0574193e0aac05598a8d6dd4da14601ef32c8";
        hash = "sha256-CozmHp263MLVsvxhIg4fxaKdswnPOtLv7V1j/Q+1B00=";
      };
    };
  });
  meta = {
    description = "Metapackage of software to install on Leo Rover.";
  };
})
