{
  ament-cmake-ros,
  ament-lint-auto,
  ament-lint-common,
  buildAmentCmakePackage,
  fetchgit,
  fetchurl,
  fetchzip,
  mkSourceSet,
  rcl-logging-interface,
  rcutils,
  rosSystemPackages,
  substituteSource,
}:
buildAmentCmakePackage (finalAttrs: {
  pname = "rcl_logging_noop";
  version = "3.5.0-1";
  src = finalAttrs.passthru.sources."rcl_logging_noop";
  nativeBuildInputs = [ ament-cmake-ros ];
  propagatedNativeBuildInputs = [ rcl-logging-interface rcutils ];
  buildInputs = [ ament-cmake-ros ];
  propagatedBuildInputs = [ rcl-logging-interface rcutils ];
  checkInputs = [ ament-lint-auto ament-lint-common ];
  passthru.sources = mkSourceSet (sources: {
    "rcl_logging_noop" = substituteSource {
      src = fetchgit {
        name = "rcl_logging_noop-source";
        url = "https://github.com/ros2-gbp/rcl_logging-release.git";
        rev = "034a49fd23a80cac2f3ca43ebf20ff4166658652";
        hash = "sha256-8SEjY4jb2WlhFLz78BUr5AjHbTk3SZAVmZIGWgupGaM=";
      };
    };
  });
  meta = {
    description = "An rcl logger implementation that doesn't do anything with log messages.";
  };
})
