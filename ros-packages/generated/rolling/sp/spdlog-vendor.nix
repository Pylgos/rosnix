{
  ament-cmake,
  ament-cmake-vendor-package,
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
  pname = "spdlog_vendor";
  version = "1.7.0-1";
  src = finalAttrs.passthru.sources."spdlog_vendor";
  nativeBuildInputs = [ ament-cmake ament-cmake-vendor-package ];
  propagatedBuildInputs = rosSystemPackages.getPackages { forBuildInputs = [ "spdlog" ]; };
  checkInputs = [ ament-lint-auto ament-lint-common ];
  passthru = {
    sources = mkSourceSet (sources: {
      "spdlog_vendor" = substituteSource {
        src = fetchgit {
          name = "spdlog_vendor-source";
          url = "https://github.com/ros2-gbp/spdlog_vendor-release.git";
          rev = "f9ebbb06b3af20a3e9f5cb13a1ae2e26d42e3f32";
          hash = "sha256-9k7bQmIpVHxO4/n3KwozH4kfqV9XLMn8Az+TXCSy4as=";
        };
        substitutions = [
          {
            path = "CMakeLists.txt";
            from = "VCS_URL https://github.com/gabime/spdlog.git";
            to = "VCS_TYPE path VCS_URL ${sources."spdlog_vendor/spdlog"}";
          }
        ];
      };
      "spdlog_vendor/spdlog" = substituteSource {
        src = fetchgit {
          name = "spdlog-source";
          url = "https://github.com/gabime/spdlog.git";
          rev = "7e635fca68d014934b4af8a1cf874f63989352b7";
          hash = "sha256-cxTaOuLXHRU8xMz9gluYz0a93O0ez2xOxbloyc1m1ns=";
        };
        substitutions = [
          {
            path = "bench/CMakeLists.txt";
            from = "GIT_REPOSITORY https://github.com/google/benchmark.git";
            to = "URL ${sources."spdlog_vendor/spdlog/benchmark"}";
          }
        ];
      };
      "spdlog_vendor/spdlog/benchmark" = substituteSource {
        src = fetchgit {
          name = "benchmark-source";
          url = "https://github.com/google/benchmark.git";
          rev = "f91b6b42b1b9854772a90ae9501464a161707d1e";
          hash = "sha256-EAJk3JhLdkuGKRMtspTLejck8doWPd7Z0Lv/Mvf3KFY=";
        };
      };
    });
  };
  meta = {
    description = "Wrapper around spdlog, providing nothing but a dependency on spdlog, on some systems. On others, it provides an ExternalProject build of spdlog.";
  };
})
