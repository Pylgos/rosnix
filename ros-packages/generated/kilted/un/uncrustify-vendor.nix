{
  ament-cmake,
  ament-cmake-vendor-package,
  buildAmentCmakePackage,
  fetchgit,
  fetchurl,
  fetchzip,
  mkSourceSet,
  rosSystemPackages,
  substituteSource,
}:
buildAmentCmakePackage (finalAttrs: {
  pname = "uncrustify_vendor";
  version = "3.1.0-2";
  src = finalAttrs.passthru.sources."uncrustify_vendor";
  nativeBuildInputs = [ ament-cmake ament-cmake-vendor-package ];
  propagatedNativeBuildInputs = rosSystemPackages.getPackages { forNativeBuildInputs = [ "uncrustify" ]; };
  buildInputs = [ ament-cmake ament-cmake-vendor-package ];
  propagatedBuildInputs = rosSystemPackages.getPackages { forBuildInputs = [ "uncrustify" ]; };
  passthru.sources = mkSourceSet (sources: {
    "uncrustify_vendor" = substituteSource {
      src = fetchgit {
        name = "uncrustify_vendor-source";
        url = "https://github.com/ros2-gbp/uncrustify_vendor-release.git";
        rev = "8d43570f8283d799ddb31ebb881c86756e4beadc";
        hash = "sha256-gE7PaJLaaJnCY/umYYkUK7f0Dxvro0yF4KWz45SDNf8=";
      };
      substitutions = [
        {
          path = "CMakeLists.txt";
          from = "VCS_URL https://github.com/uncrustify/uncrustify.git";
          to = "VCS_TYPE path VCS_URL ${sources."uncrustify_vendor/uncrustify"}";
        }
      ];
    };
    "uncrustify_vendor/uncrustify" = substituteSource {
      src = fetchgit {
        name = "uncrustify-source";
        url = "https://github.com/uncrustify/uncrustify.git";
        rev = "b8c95286f70ef8e0e83bd055a3a7aabb614a0781";
        hash = "sha256-L+YEVZC7sIDYuCM3xpSfZLjA3B8XsW5hi+zV2NEgXTs=";
      };
    };
  });
  meta = {
    description = "\n    Wrapper around uncrustify, providing nothing but a dependency on uncrustify, on some systems.\n    On others, it provides an ExternalProject build of uncrustify.\n  ";
  };
})
