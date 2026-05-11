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
  version = "8.0.0-1";
  src = finalAttrs.passthru.sources."tracetools_image_pipeline";
  nativeBuildInputs = [ ament-cmake-ros ] ++ rosSystemPackages.getPackages { forNativeBuildInputs = [ "pkg-config" ]; };
  buildInputs = [ ament-cmake-ros ] ++ rosSystemPackages.getPackages { forBuildInputs = [ "pkg-config" ]; };
  checkInputs = [ ament-lint-auto ament-lint-common ];
  passthru.sources = mkSourceSet (sources: {
    "tracetools_image_pipeline" = substituteSource {
      src = fetchgit {
        name = "tracetools_image_pipeline-source";
        url = "https://github.com/ros2-gbp/image_pipeline-release.git";
        rev = "ad39c953d28736a2e60e0c7df3b870b5aeb29d11";
        hash = "sha256-9BOHWljTa1n8xIHP/5jQxSB8u4qNNvSePR+t6Dkm7RU=";
      };
    };
  });
  meta = {
    description = "\n    LTTng tracing provider wrapper for image_pipeline ROS 2 meta-package.\n  ";
  };
})
