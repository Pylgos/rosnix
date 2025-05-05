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
  version = "5.0.10-1";
  src = finalAttrs.passthru.sources."tracetools_image_pipeline";
  nativeBuildInputs = [ ament-cmake-ros ] ++ rosSystemPackages.getPackages { forNativeBuildInputs = [ "pkg-config" ]; };
  buildInputs = [ ament-cmake-ros ] ++ rosSystemPackages.getPackages { forBuildInputs = [ "pkg-config" ]; };
  checkInputs = [ ament-lint-auto ament-lint-common ];
  passthru.sources = mkSourceSet (sources: {
    "tracetools_image_pipeline" = substituteSource {
      src = fetchgit {
        name = "tracetools_image_pipeline-source";
        url = "https://github.com/ros2-gbp/image_pipeline-release.git";
        rev = "c3758c19f1b17fb510a35d6ca77ddd03b0134d6a";
        hash = "sha256-0khW3XlT7OiprTxVuI1jN5hmfro8LGzWrvpS19B5McY=";
      };
    };
  });
  meta = {
    description = "\n    LTTng tracing provider wrapper for image_pipeline ROS 2 meta-package.\n  ";
  };
})
