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
  version = "5.0.5-1";
  src = finalAttrs.passthru.sources."tracetools_image_pipeline";
  nativeBuildInputs = [ ament-cmake-ros ] ++ rosSystemPackages.getPackages { forNativeBuildInputs = [ "pkg-config" ]; };
  checkInputs = [ ament-lint-auto ament-lint-common ];
  passthru.sources = mkSourceSet (sources: {
    "tracetools_image_pipeline" = substituteSource {
      src = fetchgit {
        name = "tracetools_image_pipeline-source";
        url = "https://github.com/ros2-gbp/image_pipeline-release.git";
        rev = "0576855249982fcc9c42a1e0ea5c3dc09d5064d6";
        hash = "sha256-iWdZUGmT61D57BDFmePuMaSgBa1lOzB8MzpNXhcRgGY=";
      };
    };
  });
  meta = {
    description = "LTTng tracing provider wrapper for image_pipeline ROS 2 meta-package.";
  };
})
