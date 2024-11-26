{
  ament-cmake,
  buildAmentCmakePackage,
  fetchgit,
  fetchurl,
  fetchzip,
  leo,
  leo-bringup,
  leo-fw,
  mkSourceSet,
  rosSystemPackages,
  substituteSource,
}:
buildAmentCmakePackage (finalAttrs: {
  pname = "leo_robot";
  version = "2.0.0-1";
  src = finalAttrs.passthru.sources."leo_robot";
  nativeBuildInputs = [ ament-cmake ];
  propagatedBuildInputs = [ leo leo-bringup leo-fw ];
  passthru.sources = mkSourceSet (sources: {
    "leo_robot" = substituteSource {
      src = fetchgit {
        name = "leo_robot-source";
        url = "https://github.com/ros2-gbp/leo_robot-release.git";
        rev = "761788aee0dc76f087e8078e3ab497af04eaa9e8";
        hash = "sha256-JcxBJPkbijaYWriR5InIZU+gMtzZaoTf9pKJhyEe3wo=";
      };
    };
  });
  meta = {
    description = "Metapackage of software to install on Leo Rover.";
  };
})
