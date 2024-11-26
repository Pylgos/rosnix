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
  version = "6.0.5-1";
  src = finalAttrs.passthru.sources."tracetools_image_pipeline";
  nativeBuildInputs = [ ament-cmake-ros ] ++ rosSystemPackages.getPackages { forNativeBuildInputs = [ "pkg-config" ]; };
  checkInputs = [ ament-lint-auto ament-lint-common ];
  passthru = {
    sources = mkSourceSet (sources: {
      "tracetools_image_pipeline" = substituteSource {
        src = fetchgit {
          name = "tracetools_image_pipeline-source";
          url = "https://github.com/ros2-gbp/image_pipeline-release.git";
          rev = "c68d451e8f75091b1cf84ee06369e076fcacb31e";
          hash = "sha256-POrMLhd2ai/1YvGNiEd7hEnXEsB4y8HyKYYx5kzcy3s=";
        };
      };
    });
  };
  meta = {
    description = "LTTng tracing provider wrapper for image_pipeline ROS 2 meta-package.";
  };
})
