{
  ament-cmake-auto,
  ament-lint-auto,
  autoware-cmake,
  autoware-downsample-filters,
  autoware-ekf-localizer,
  autoware-lint-common,
  autoware-ndt-scan-matcher,
  autoware-pose-initializer,
  autoware-stop-filter,
  autoware-twist2accel,
  buildAmentCmakePackage,
  fetchgit,
  fetchurl,
  fetchzip,
  mkSourceSet,
  rosSystemPackages,
  substituteSource,
  topic-tools,
}:
buildAmentCmakePackage (finalAttrs: {
  pname = "autoware_core_localization";
  version = "1.8.0-1";
  src = finalAttrs.passthru.sources."autoware_core_localization";
  nativeBuildInputs = [ ament-cmake-auto autoware-cmake ];
  propagatedNativeBuildInputs = [ autoware-downsample-filters autoware-ekf-localizer autoware-ndt-scan-matcher autoware-pose-initializer autoware-stop-filter autoware-twist2accel topic-tools ];
  buildInputs = [ ament-cmake-auto autoware-cmake ];
  propagatedBuildInputs = [ autoware-downsample-filters autoware-ekf-localizer autoware-ndt-scan-matcher autoware-pose-initializer autoware-stop-filter autoware-twist2accel topic-tools ];
  checkInputs = [ ament-lint-auto autoware-lint-common ];
  passthru.sources = mkSourceSet (sources: {
    "autoware_core_localization" = substituteSource {
      src = fetchgit {
        name = "autoware_core_localization-source";
        url = "https://github.com/ros2-gbp/autoware_core-release.git";
        rev = "26e9d7679028c4930aa3a783ac262e17443987ae";
        hash = "sha256-D8SfmYAB4zL/TE1lgQjOaLlbh2g3Wo/Pztb0RWRHOo0=";
      };
    };
  });
  meta = {
    description = "The autoware_core_localization package";
  };
})
