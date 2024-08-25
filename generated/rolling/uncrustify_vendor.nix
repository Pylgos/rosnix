{
  ament_cmake,
  ament_cmake_vendor_package,
  buildRosPackage,
  fetchgit,
  fetchurl,
  fetchzip,
  substituteSource,
  uncrustify,
}:
let
  sources = rec {
    uncrustify_vendor = substituteSource {
      src = fetchgit {
        name = "uncrustify_vendor-source";
        url = "https://github.com/ros2-gbp/uncrustify_vendor-release.git";
        rev = "1305134544d1939805a070f24b44ec66ce3baf0c";
        hash = "sha256-gE7PaJLaaJnCY/umYYkUK7f0Dxvro0yF4KWz45SDNf8=";
      };
      substitutions = [
        {
          path = "CMakeLists.txt";
          from = "VCS_URL https://github.com/uncrustify/uncrustify.git";
          to = "VCS_TYPE path VCS_URL ${uncrustify_vendor-vendor_source-uncrustify-0}";
        }
      ];
    };
    uncrustify_vendor-vendor_source-uncrustify-0 = substituteSource {
      src = fetchgit {
        name = "uncrustify_vendor-vendor_source-uncrustify-0-source";
        url = "https://github.com/uncrustify/uncrustify.git";
        rev = "b8c95286f70ef8e0e83bd055a3a7aabb614a0781";
        hash = "sha256-L+YEVZC7sIDYuCM3xpSfZLjA3B8XsW5hi+zV2NEgXTs=";
      };
      substitutions = [
      ];
    };
  };
in
buildRosPackage {
  pname = "uncrustify_vendor";
  version = "3.1.0-1";
  src = sources.uncrustify_vendor;
  nativeBuildInputs = [ ament_cmake ament_cmake_vendor_package ];
  propagatedNativeBuildInputs = [ uncrustify ];
  buildInputs = [ ament_cmake ament_cmake_vendor_package ];
  propagatedBuildInputs = [ uncrustify ];
  depsTargetTarget = [  ];
  depsTargetTargetPropagated = [  ];
  checkInputs = [  ];
  missingDependencies = [  ];
  meta = {
    description = "Wrapper around uncrustify, providing nothing but a dependency on uncrustify, on some systems. On others, it provides an ExternalProject build of uncrustify.";
  };
}
