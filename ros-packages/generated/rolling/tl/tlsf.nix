{
  ament-cmake,
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
  pname = "tlsf";
  version = "0.11.1-1";
  src = finalAttrs.passthru.sources."tlsf";
  propagatedNativeBuildInputs = [ ament-cmake ];
  propagatedBuildInputs = [ ament-cmake ];
  checkInputs = [ ament-lint-auto ament-lint-common ];
  passthru.sources = mkSourceSet (sources: {
    "tlsf" = substituteSource {
      src = fetchgit {
        name = "tlsf-source";
        url = "https://github.com/ros2-gbp/tlsf-release.git";
        rev = "ddae829a18d65cb3826405bfa6750c262d97e13a";
        hash = "sha256-7nO1LtsXrVwRfydrbRCo6Ww7LeW+zNRzQnhRvLr+HN4=";
      };
    };
  });
  meta = {
    description = "TLSF allocator version 2.4.6";
  };
})
