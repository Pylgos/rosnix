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
  version = "6.0.8-1";
  src = finalAttrs.passthru.sources."tracetools_image_pipeline";
  nativeBuildInputs = [ ament-cmake-ros ] ++ rosSystemPackages.getPackages { forNativeBuildInputs = [ "pkg-config" ]; };
  checkInputs = [ ament-lint-auto ament-lint-common ];
  passthru.sources = mkSourceSet (sources: {
    "tracetools_image_pipeline" = substituteSource {
      src = fetchgit {
        name = "tracetools_image_pipeline-source";
        url = "https://github.com/ros2-gbp/image_pipeline-release.git";
        rev = "c3c88aeeb92790dba9bdea204b70b829390146df";
        hash = "sha256-Nk9mD6TO8KyafUGszQ8RxIxb94gibZ6PCe9USApppfU=";
      };
    };
  });
  meta = {
    description = "LTTng tracing provider wrapper for image_pipeline ROS 2 meta-package.";
  };
})
