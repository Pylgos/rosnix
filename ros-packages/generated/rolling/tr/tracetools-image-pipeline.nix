{
  ament-cmake-ros,
  ament-lint-auto,
  ament-lint-common,
  buildAmentCmakePackage,
  fetchgit,
  fetchurl,
  fetchzip,
  mkSourceSet,
  rosSystemPackages,
  substituteSource,
}:
buildAmentCmakePackage (finalAttrs: {
  pname = "tracetools_image_pipeline";
  version = "7.1.1-1";
  src = finalAttrs.passthru.sources."tracetools_image_pipeline";
  nativeBuildInputs = [ ament-cmake-ros ] ++ rosSystemPackages.getPackages { forNativeBuildInputs = [ "pkg-config" ]; };
  buildInputs = [ ament-cmake-ros ] ++ rosSystemPackages.getPackages { forBuildInputs = [ "pkg-config" ]; };
  checkInputs = [ ament-lint-auto ament-lint-common ];
  passthru.sources = mkSourceSet (sources: {
    "tracetools_image_pipeline" = substituteSource {
      src = fetchgit {
        name = "tracetools_image_pipeline-source";
        url = "https://github.com/ros2-gbp/image_pipeline-release.git";
        rev = "26b4526ac60915c45b5e0e4614806217debca135";
        hash = "sha256-ufwluD55/5O+8uomgnta7W0El4++vSumt5Ezp8k7/z0=";
      };
    };
  });
  meta = {
    description = "\n    LTTng tracing provider wrapper for image_pipeline ROS 2 meta-package.\n  ";
  };
})
